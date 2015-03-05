require 'pry'
require 'json'
class Api

  attr_accessor :search_hash, :url

  BASE_URL = "https://feedwrangler.net/api/v2/podcasts/search?search_term="

  def initialize(keyword)
   @url = "#{BASE_URL}#{keyword}"
  end

  def get_json
    binding.pry
  	@search_hash = JSON.load(open(@url))
  end

  def load
    binding.pry
    self.get_json
    @search_hash[:podcasts].each do |podcast|
      podcast = Podcast.new
      podcast.title = podcast[:title]
      binding.pry
        podcast.identifier = podcast[:podcast_id]
      podcast.image_url = podcast[:image_url]
      podcast.feed_url = podcast[:feed_url]
    end
  end
 
end
binding.pry

