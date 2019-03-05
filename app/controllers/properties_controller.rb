require 'open-uri'
require 'nokogiri'

class PropertiesController < ApplicationController
  before_action :scrapping_params, :scrapping

  def new
  end

  def create
    @urls.each do |url|
      html_file = open(url).read
      html_doc = Nokogiri::HTML(html_file)
      price = html_doc.search(".item-price").text.strip
      html_doc.search(".item-price").remove
      title = html_doc.search('.item-title').text.strip
      phone = html_doc.at('.txt-indigo').text.strip if html_doc.at('.txt-indigo')
      full_city = html_doc.search(".margin-bottom-8").text.strip
      full_date = html_doc.search(".item-date").text.strip
      reference = full_date[11, 5]
      date = full_date[19...full_date.length].to_date
      @property = Property.create(price: price, title: title, phone: phone, ref: reference, date: date, url: url, city: full_city)
    end
    redirect_to properties_path
  end

  def index
    @properties = Property.all
  end

  private

  def scrapping
    @urls = []
    url = params[:url_input]
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    html_doc.search('.item-title').each do |element|
      element.text.strip
      mini_url = element.attribute('href').value
      full_url = "https://www.pap.fr#{mini_url}"
      @urls << full_url
    end
  end

  def scrapping_params
    params.require(:property).permit(:url_input)
  end

  # def scrapping_multiple
  #   init_url = "https://www.pap.fr/annonce/locations-meuble-lyon-69-g43590"
  #   list_url = " "
  #   page_counter = 1
  #   @urls = []
  #   3.times do
  #     page_counter == 1 ? page_url = init_url : page_url = list_url
  #     html_file = open(page_url).read
  #     html_doc = Nokogiri::HTML(html_file)
  #     html_doc.search('.item-title').each do |element|
  #       element.text.strip
  #       mini_url = element.attribute('href').value
  #       full_url = "https://www.pap.fr#{mini_url}"
  #       @urls << full_url
  #     end
  #     page_counter += 1
  #     list_url = init_url + "-#{page_counter}"
  #   end
  # end
end
