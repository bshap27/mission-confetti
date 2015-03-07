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
      p = Podcast.find_or_create_by(title: podcast["title"], identifier: podcast["podcast_id"], image_url: podcast["image_url"], feed_url: podcast["feed_url"])
      episode_hash = JSON.load(open("https://feedwrangler.net/api/v2/podcasts/show?podcast_id=#{p.identifier}"))
      p.summary = episode_hash["podcast"]["summary"]
      p.save
      episode_hash["podcast"]["recent_episodes"].each do |episode|
        e = Episode.find_or_create_by(title: episode["title"], url: episode["audio_url"], podcast_id: p.id)
      end
      t = Topic.find_by(:name => @topic.capitalize)
      if t
        PodcastsTopic.create(:podcast_id => p.id, :topic_id => t.id)
      else 
        t = Topic.create(:name => @topic.capitalize)  
        PodcastsTopic.create(:podcast_id => p.id, :topic_id => t.id)
      end
    end
  end
end

