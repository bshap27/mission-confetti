class Scraper

 attr_accessor :page

 def initialize
   @url = "https://itunes.apple.com/us/genre/podcasts/id26?mt=2"
   @page = Nokogiri::HTML(open(@url))
 end

 def scrape
   self.page.search("div.grid3-column a.top-level-genre").each do |genre|
   	binding.pry
      all_genres = Topic.new(genre.text)
      
		end
 end

end