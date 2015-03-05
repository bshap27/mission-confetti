class Podcast < ActiveRecord::Base

	has_many :user_podcasts
	has_many :users, through: :user_podcasts
	has_many :posts
	has_many :topics, through: :podcast_topics
	has_many :podcast_topics
end