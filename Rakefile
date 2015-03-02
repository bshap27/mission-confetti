ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment.rb'
require 'sinatra/activerecord/rake'

task :console do# => [:environment] do
  Pry.start
end

task :clean_database do
  DatabaseCleaner.strategy = :truncation
  DatabaseCleaner.clean
end