class PostsController < ApplicationController

  def locate_redirect(post)
    if post.podcast_id
      redirect "/podcasts/#{post.podcast_id}"
    elsif post.episode_id
      episode_id = post.episode_id
      episode = Episode.find(episode_id)
      podcast = episode.podcast
      redirect "/podcasts/#{podcast.id}/#{episode_id}" 
    end
  end

  post '/posts' do # CREATE
    @post = Post.create(params[:post])
    if @post.podcast_id
      @podcast = Podcast.find(params[:post][:podcast_id])
    elsif @post.episode_id
      @episode = Episode.find(params[:post][:episode_id])
    end
    locate_redirect(@post)
  end  

  get '/posts/:id/edit' do #EDIT
    @post = Post.find(params[:id])
    erb :"search/edit_posts.html"
  end

  post '/posts/:id/delete' do #DELETE
   @post = Post.find(params[:id])
   @post.destroy
    locate_redirect(@post)
  end

  patch "/posts/:id" do # UPDATE
    @post = Post.find(params[:id])
    @post.update(params[:post])
      locate_redirect(@post)
  end

end  


