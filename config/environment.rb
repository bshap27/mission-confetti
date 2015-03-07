ENV['SINATRA_ENV'] ||= "development"

require 'sinatra/flash'
require 'bundler/setup'
Bundler.require

DB = ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/development.sqlite"
)

require_all 'app'
# require_relative '../Rakefile'