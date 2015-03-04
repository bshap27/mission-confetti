class RegistrationsController < ApplicationController

	set :sessions => true

	# register do
 #    def auth (type)
 #      condition do
 #        redirect "/newuser" unless send("is_#{type}?")
 #      end
 #    end
 #  end

 #  helpers do
 #    def is_user?
 #      @user != nil
 #    end
 #  end

 #  before do
 #    @user = User.get(session[:user_id])
 #  end

  # get "/protected", :auth => :user do
  #   "Hello, #{@user.first_name}."
  # end

  post "/login" do
    # session[:user_id] = User.authenticate(params[:user]).id
    # @user = User.find_by(:username => params[:user][:username])
    erb :"registrations/login.html"
  end

 #  get "/logout" do
 #    session[:user_id] = nil
 #  end

	######

	post '/newuser' do
		@user = User.create(params[:user])
		erb :"registrations/new_user_show.html"
	end

	get '/newuser' do
		# throw Unauthorized unless user_registered?
		erb :"registrations/new_user.html"
	end

	# def user_registered?
	# 	session[:registered]
	# end 	

end