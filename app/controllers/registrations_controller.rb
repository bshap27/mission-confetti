class RegistrationsController < ApplicationController

	post '/new' do
		@name = params[:name]
		@email = params[:email]
		erb :"new_user"
	end

	get '/new' do
		throw Unauthorized unless user_registered?
		erb :"new_user"
	end

	def user_registered?
		session[:registered]
	end 	

end