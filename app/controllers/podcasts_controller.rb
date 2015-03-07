class PodcastsController < ApplicationController

  get '/' do
    @topics = Topic.all
    @categories_array = ["Arts", "Business", "Comedy", "Education", "Games & Hobbies", "Government & Organizations", "Health", "Kids & Family", "Music", "News & Politics", "Religion & Spirituality", "Science & Medicine", "Society & Culture", "Sports & Recreation", "TV & Film", "Technology"]
    erb :'index.html'
  end

  get '/results' do
    # binding.pry
    # Podcast.delete_all
    @keyword = params[:searchkeyword]
    Api.new(@keyword).load
    @podcasts = Podcast.joins(:podcasts_topics).where({ "podcasts_topics.topic_id" => Topic.find_by(name: @keyword.capitalize)})
    erb :'/search/results.html'
  end

  # get '/topics/:topic' do
  #   @topic = Topic.find_by(name: params[:topic])
  #   erb :'topic.html'
  # end

  get '/podcasts/:id' do
    @podcast = Podcast.find(params[:id])
    erb :'/search/podcasts.html'
  end

  get '/podcasts/:id/:episode_id' do
    @podcast = Podcast.find(params[:id])
    @episode = Episode.find(params[:episode_id])
    erb :'/search/episodes.html'
  end

end
