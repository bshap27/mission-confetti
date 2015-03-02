require 'pry'
require 'nokogiri'
require 'open-uri'

def categories
  html = open('https://itunes.apple.com/us/genre/podcasts/id26?mt=2')
  web_categories = Nokogiri::HTML(html)

    all_categories = []

   web_categories.css("div.grid3-column").collect do |specific_category|
   all_categories << specific_category.css("a.top-level-genre").text
 end

  all_categories
  binding.pry
end

categories


