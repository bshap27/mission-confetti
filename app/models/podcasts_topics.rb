class PodcastsTopic < ActiveRecord::Base

	belongs_to :podcast
	belongs_to :topic

end