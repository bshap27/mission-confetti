class RegistrationsController < ApplicationController

  post "/login" do
    begin
      @valid_user = true
      @user = User.find_by(:username => params[:username])
      session[:user_id] = @user.id
    rescue
      @valid_user = false
    end
    redirect '/'
  end

  post "/logout" do
    session[:user_id] = ""
    redirect '/'
  end

  # if username is not associated with a valid User instance, redirect to HERE:
  # slash let somebody link to the new user page without having to try a username.
	post '/newuser' do
		@user = User.create(params[:user])
		erb :"registrations/new_user_show.html"
	end

	get '/newuser' do
		# throw Unauthorized unless user_registered?
		erb :"registrations/new_user.html"
	end	

end