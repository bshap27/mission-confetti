ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment.rb'
require 'sinatra/activerecord/rake'

task :console do# => [:environment] do
  Pry.start
end