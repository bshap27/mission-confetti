class Podcast < ActiveRecord::Base
  has_many :episodes
	has_many :user_podcasts
	has_many :users, through: :user_podcasts
	has_many :posts
	has_many :topics, through: :podcasts_topics
	has_many :podcasts_topics
end