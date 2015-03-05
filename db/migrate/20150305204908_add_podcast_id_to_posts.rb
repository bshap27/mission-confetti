class AddPodcastIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :podcast_id, :integer
  end
end
