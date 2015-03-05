require 'json'
require 'open-uri'

class Api

  attr_accessor :search_hash, :url, :topic

  BASE_URL = "https://feedwrangler.net/api/v2/podcasts/search?search_term="

  def initialize(topic)
   @url = "#{BASE_URL}#{topic}"
   @topic = topic
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
      p.save
      t = Topic.find_by(:name => @topic.capitalize)
      if t
        PodcastsTopic.create(:podcast_id => p.id, :topic_id => t.id)
      else 
        t = Topic.create(:name => @topic.capitalize)  
        PodcastsTopic.create(:podcast_id => p.id, :topic_id => t.id)
      end
      #associate search keyword with podcast instance
      #find topic instance for search keyword (stored in topic class)
      #if the topic instance exists, then we associate it with the podcast, if not, we create a new instance and associate with the podcast  
      
    end
  end
end

