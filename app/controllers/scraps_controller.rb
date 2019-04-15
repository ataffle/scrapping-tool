require 'open-uri'
require 'nokogiri'

class ScrapsController < ApplicationController

  def new
    @scrap = Scrap.new
  end

  def create
    @scrap = Scrap.new(scrap_params)
    @scrap.user_id = current_user.id
    if @scrap.save
      scrapping(@scrap.scrap_url)
      parsing(@urls, @scrap)
      redirect_to scrap_path(@scrap, @properties)
    else
      redirect_to root_path
    end
  end

  def show
    @scrap = Scrap.find(params[:id])
    @properties = Property.where(scrap_id: @scrap.id)
  end

  private

  def scrap_params
    params.require(:scrap).permit(:scrap_url)
  end

  def scrapping(url)
    @urls = []
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('.item-title').each do |element|
      element.text.strip
      mini_url = element.attribute('href').value
      full_url = "https://www.pap.fr#{mini_url}"
      @urls << full_url
    end
  end

  def parsing(urls, scrap)
    urls.each do |url|
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      price = html_doc.search(".item-price").text.strip
      html_doc.search(".item-price").remove
      title = html_doc.search('.item-title').text.strip
      phone = html_doc.at('.txt-indigo').text.strip if html_doc.at('.txt-indigo')
      full_city = html_doc.search(".margin-bottom-8").text.strip
      full_date = html_doc.search(".item-date").text.strip
      reference = full_date[11, 5]
      date = full_date[19...full_date.length]
      # date = Date.strptime(full_date[19...full_date.length], "%d/%m/%Y")
      raise
      @property = Property.create(price: price, title: title, phone: phone, ref: reference, date: date, url: url, city: full_city, scrap_id: @scrap.id)
    end
  end
end
