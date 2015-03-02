require 'sinatra/base'

class App < ApplicationController

  get '/' do
    erb :'index.html'
  end

  get '/:category' do
    # @category = Category.find(params[:category])
    erb :'category.html'
  end

  get '/results' do
    erb :'results.html'
  end

end