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
    @topics = Topic.all
    erb :'index.html'
  end

  get '/results' do
    # binding.pry
    Podcast.delete_all
    @keyword = params[:searchkeyword]
    Api.new(@keyword).load
    @podcasts = Podcast.all
    erb :'/search/results.html'
  end

  get '/topics/:topic' do
    @topic = Topic.find_by(name: params[:topic])
    erb :'topic.html'
  end

end