require 'pry'

class Scraper

 attr_accessor :page

 def initialize
   @url = "https://itunes.apple.com/us/genre/podcasts/id26?mt=2"
   @page = Nokogiri::HTML(open(@url))
   binding.pry
 end

 def scrape
   self.page.css('div.grid3-column a.top-level-genre').collect do |genre|
      all_genres = Topic.new(genre.css.text)
   end
 end
 
end