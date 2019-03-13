require 'open-uri'
require 'nokogiri'

class ScrapsController < ApplicationController

def new
  @scrap = Scrap.new
end

def create
  @scrap = Scrap.new(scrap_params)
  if @scrap.save
    scrapping(@scrap.url)
    redirect_to :controller => 'properties', :action => 'create'
  else
    redirect to root_path
  end
end

private

def scrap_params
  params.require(:scrap).permit(:url)
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

end
