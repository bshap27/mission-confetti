require './config/environment.rb'

use Rack::MethodOverride
use Rack::Session::Cookie, :user_id => ""

use RegistrationsController
use PostsController
run ApplicationController