class PostsController < ApplicationController

  post '/posts' do # CREATE
    @post = Post.create(params[:post])
    @episode = Episode.find(params[:post][:episode_id])
    redirect "/podcasts/#{@episode.podcast_id}/#{@episode.id}"
  end  

  get '/posts/:id/edit' do
    # binding.pry
    @post = Post.find(params[:id])
    erb :"search/edit_posts.html"
  end

  patch "/posts/:id" do # UPDATE
    @post = Post.find(params[:id])
    @post.update(params[:post])

    if @post.podcast_id
      redirect "/podcasts/#{@post.podcast_id}"
    elsif @post.episode_id
      episode_id = @post.episode_id
      episode = Episode.find(episode_id)
      podcast = episode.podcast
      redirect "/podcasts/#{podcast.id}/#{episode_id}" 
    end
  end

  # get '/posts' do # INDEX
  #   @posts = Post.all
  #   # binding.pry
  #   erb :"posts/index.html"
  # end

  # get '/posts/new' do # NEW
  #   @users = User.all

  #   erb :"posts/new.html"
  # end

  # get "/posts/:id" do # SHOW
  #   @post = Post.find(params[:id])

  #   erb :"posts/show.html"
  # end

  # get '/posts/:id/edit' do
  #   @post = Post.find(params[:id])

  #   erb :"posts/edit.html"
  # end


  # post '/posts' do # CREATE
  #   @post = Post.create(params[:post])
  #   # binding.pry
  #   redirect "/posts/#{@post.id}"
  # end  


end

# 1. Index all blogs posts
# 2. show a blog posts
# 3. present the user with a form to write a blog posts
# 4. accept that forms data and create a blog post

