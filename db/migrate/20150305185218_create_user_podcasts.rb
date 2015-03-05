class CreateUserPodcasts < ActiveRecord::Migration
  def change
  	create_table :user_podcasts do |t|
  		t.integer :user_id
  		t.integer :podcast_id
  	end
  end
end
