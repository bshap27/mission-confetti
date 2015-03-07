class RegistrationsController < ApplicationController

  post "/login" do
    begin
      @user = User.find_by(:username => params[:username])
      session[:user_id] = @user.id
    rescue
      flash[:invaliduser] = "Invalid username. Please try again or create a new account."
    end
    redirect '/'
  end

  post "/logout" do
    session[:user_id] = ""
    redirect '/'
  end

	post '/newuser' do
		@user = User.create(params[:user])
    session[:user_id] = @user.id
    flash[:newuser] = "Thank you for registering for this site! We're thrilled to have you!"
    redirect '/'
	end

  get '/user_account' do

    @user = current_user
    erb :"registrations/user_account.html"
  end

	get '/newuser' do
		erb :"registrations/new_user.html"
	end	

end