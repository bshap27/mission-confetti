class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  def user_logged_in?
    session[:user_id] != "" && session[:user_id]
  end

  def current_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

end
