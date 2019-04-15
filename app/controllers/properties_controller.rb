require 'open-uri'
require 'nokogiri'

class PropertiesController < ApplicationController
  before_action :scrap_params

  # def new
  # end

  def create
    urls = scrap_params
    raise
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
      date = full_date[19...full_date.length].to_date
      @property = Property.create(price: price, title: title, phone: phone, ref: reference, date: date, url: url, city: full_city)
    end
    redirect_to properties_path
  end

  def index
    @properties = Property.all
  end
end

private

def scrap_params
  params.permit(:urls)
end
