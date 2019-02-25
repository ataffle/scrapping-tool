require 'open-uri'
require 'nokogiri'


class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

#   def scrapping
#     url = "https://www.pap.fr/annonce/locations-meuble-lyon-69-g43590"
#     html_file = open(url).read
#     html_doc = Nokogiri::HTML(html_file)

#     urls = []
#     html_doc.search('.item-title').each do |element|
#       element.text.strip
#       mini_url = element.attribute('href').value
#       full_url = "https://www.pap.fr#{mini_url}"
#       urls << full_url
#     end

#     # @properties =[]
#     # urls.each do |url|
#     #   html_file = open(url).read
#     #   html_doc = Nokogiri::HTML(html_file)
#     #   price = html_doc.search(".item-price").text.strip
#     #   html_doc.search(".item-price").remove
#     #   title = html_doc.search('.item-title').text.strip
#     #   phone = html_doc.at('.txt-indigo').text.strip if html_doc.at('.txt-indigo')
#     #   full_date = html_doc.search(".item-date").text.strip
#     #   reference = full_date[11, 5]
#     #   date = full_date[19...full_date.length].to_date
#     #   property = {
#     #     "price" => price,
#     #     "url" => url,
#     #     "title" => title,
#     #     "phone" => phone,
#     #     "reference" => reference,
#     #     "date" => date
#     #   }
#     #   @properties << property
#       # mini_url = element.attribute('href').value
#       # full_url = "https://www.pap.fr#{mini_url}"
#       # urls << full_url
#     end
#   end
end
