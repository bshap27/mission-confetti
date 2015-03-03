require './config/environment.rb'

use Rack::MethodOverride
use RegistrationsController
use PostsController
run App