require 'pry'
require 'json'
require 'open-uri'

class Api

  attr_accessor :search_hash, :url

  BASE_URL = "https://feedwrangler.net/api/v2/podcasts/search?search_term="

  def initialize(keyword)
   @url = "#{BASE_URL}#{keyword}"
  end

  def get_json
  	@search_hash = JSON.load(open(@url))
  end

  def load
    self.get_json
    @search_hash["podcasts"].each do |podcast|
      # binding.pry
      p = Podcast.new
      p.title = podcast["title"]
      p.identifier = podcast["podcast_id"]
      p.image_url = podcast["image_url"]
      p.feed_url = podcast["feed_url"]
      p.save
    end
  end
 
end
# binding.pry