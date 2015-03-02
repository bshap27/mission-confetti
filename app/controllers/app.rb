require 'sinatra/base'

class App < ApplicationController

  get '/' do
    @topics = Topic.all
    erb :'index.html'
  end

  get '/results' do
    @keyword = params[:searchkeyword]
    erb :'results.html'
  end

  get '/topics/:topic' do
    # binding.pry
    @topic = Topic.find_by(name: params[:topic])
    erb :'topic.html'
  end



end