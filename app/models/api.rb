require 'pry'
require 'json'
require 'open-uri'

class Api

  attr_accessor :search_hash, :url

  BASE_URL = "https://feedwrangler.net/api/v2/podcasts/search?search_term="

  def initialize(topic)
   @url = "#{BASE_URL}#{topic}"
  end

  def get_json
  	@search_hash = JSON.load(open(@url))
  end

  def load
    self.get_json
    @search_hash["podcasts"].each do |podcast|
      p = Podcast.new
      p.title = podcast["title"]
      p.identifier = podcast["podcast_id"]
      p.image_url = podcast["image_url"]
      p.feed_url = podcast["feed_url"]
      t = Topic.find_by(:name => topic.capitalize)
      if t
        p.create_podcast_topic(:podcast_id => p.id, :topic_id => t.id)
      else 
        t = Topic.create(:name => topic.capitalize)  
        p.create_podcast_topic(:podcast_id => p.id, :topic_id => t.id)
      end
      #associate search keyword with podcast instance
      #find topic instance for search keyword (stored in topic class)
      #if the topic instance exists, then we associate it with the podcast, if not, we create a new instance and associate with the podcast  
      p.save
    end
  end
 end

