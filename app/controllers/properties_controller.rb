require 'open-uri'
require 'nokogiri'

class PropertiesController < ApplicationController
  before_action :scrapping

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
      full_date = html_doc.search(".item-date").text.strip
      reference = full_date[11, 5]
      date = full_date[19...full_date.length].to_date
      @property = Property.create(price: price, title: title, phone: phone, ref: reference, date: date, url: url, city: "Lyon")
    end
    redirect_to properties_path
  end

  def index
    @properties = Property.all
  end

  private

  def scrapping
    url = "https://www.pap.fr/annonce/locations-meuble-lyon-69-g43590"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    @urls = []
    html_doc.search('.item-title').each do |element|
      element.text.strip
      mini_url = element.attribute('href').value
      full_url = "https://www.pap.fr#{mini_url}"
      @urls << full_url
    end
  end


end
