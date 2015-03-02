class PostsController < ApplicationController

  get '/' do # INDEX
    @posts = Post.all

    erb :"posts/index.html"
  end

  get '/posts/new' do # NEW
    @authors = Author.all

    erb :"posts/new.html"
  end

  get "/posts/:id" do # SHOW
    @post = Post.find(params[:id])

    erb :"posts/show.html"
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])

    erb :"posts/edit.html"
  end


  post '/posts' do # CREATE
    @post = Post.new(params[:post])
    # <input type="text" name="post[author_name]">
    @post.author_name = params[:post][:author_name]


    # @post.author_name = params[:author_name]
    # @post.title = params[:title]
    # @post.content = params[:content]
    # # @post.author = Author.find(params[:author_id])
    # @post.author_id = params[:author_id]

    @post.save

    redirect "/posts/#{@post.id}"
  end  

  patch "/posts/:id" do # UPDATE
    @post = Post.find(params[:id])

    # @post.title = params[:post][:title]
    # @post.content = params[:post][:content]

    @post.update(params[:post])

    redirect "/posts/#{@post.id}"
  end
end

# 1. Index all blogs posts
# 2. show a blog posts
# 3. present the user with a form to write a blog posts
# 4. accept that forms data and create a blog post