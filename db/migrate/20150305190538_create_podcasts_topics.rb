class CreatePodcastsTopics < ActiveRecord::Migration
  def change
  	create_table :podcasts_topics do |t|
  		t.integer :podcast_id
  		t.integer :topic_id
  	end
  end
end
