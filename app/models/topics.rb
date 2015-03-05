class Topic < ActiveRecord::Base

  has_many :subtopics
  has_many :podcasts, through: :podcast_topics
  has_many :podcast_topics
  
end