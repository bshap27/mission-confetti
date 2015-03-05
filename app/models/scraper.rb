require 'open-uri'

class Scraper

  attr_accessor :page

  def initialize
   @url = "https://itunes.apple.com/us/genre/podcasts/id26?mt=2"
   @page = Nokogiri::HTML(open(@url))
  end

  def scrape
    self.page.css('div.grid3-column li').each do |genre_block|
      genre_block.css('a.top-level-genre').each do |genre_name|
        t = Category.find_or_create_by(name: genre_name.text, url: genre_name['href'])
        # genre_block.css('ul.top-level-subgenres li').each do |li|
          # Subtopic.find_or_create_by(name: li.text, url: li.search('a').attribute('href').value, topic_id: t.id)
        # end
      end
    end
  end
 
end