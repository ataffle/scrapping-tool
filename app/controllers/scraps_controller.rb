require 'open-uri'
require 'nokogiri'

class ScrapsController < ApplicationController

def new
  @scrap = Scrap.new
end

def create
end

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

private

end
