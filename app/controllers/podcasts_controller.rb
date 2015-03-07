class PodcastsController < ApplicationController

  get '/' do
    @newuser = true if flash[:newuser]
    @topics = Topic.all
    @categories_array = ["Arts", "Business", "Comedy", "Education", "Hobbies", "Government", "Health", "Kids", "Music", "News", "Politics", "Religion", "Science", "Medicine", "Culture", "Sports", "TV", "Film", "Technology"]
    # binding.pry
    erb :'index.html'
  end

  get '/results' do
    # binding.pry
    # Podcast.delete_all
    @keyword = params[:searchkeyword]
    if Topic.find_by(name: @keyword.capitalize)
      @podcasts = Podcast.joins(:podcasts_topics).where({ "podcasts_topics.topic_id" => Topic.find_by(name: @keyword.capitalize)})
    else
      Api.new(@keyword).load
      @podcasts = Podcast.joins(:podcasts_topics).where({ "podcasts_topics.topic_id" => Topic.find_by(name: @keyword.capitalize)})
    end
    erb :'/search/results.html'
  end

  # get '/topics/:topic' do
  #   @topic = Topic.find_by(name: params[:topic])
  #   erb :'topic.html'
  # end

  get '/podcasts/:id' do
    # binding.pry
    @podcast = Podcast.find(params[:id])
    erb :'/search/podcasts.html'
  end

  get '/podcasts/:id/:episode_id' do
    @podcast = Podcast.find(params[:id])
    @episode = Episode.find(params[:episode_id])
    erb :'/search/episodes.html'
  end

end
