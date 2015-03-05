require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  def user_logged_in?
    session[:user_id] != ""
  end

  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  get '/' do
    # binding.pry
    @topics = Topic.all
    erb :'index.html'
  end

  get '/results' do
    Podcast.delete_all
    @keyword = params[:searchkeyword]
    Api.new(@keyword).load
    @podcasts = Podcast.all
    erb :'/search/results.html'
  end

  get '/topics/:topic' do
    # binding.pry
    @topic = Topic.find_by(name: params[:topic])
    erb :'search/topic.html'
  end

end