class AddUrlToSubtopics < ActiveRecord::Migration
  def change
    add_column(:subtopics, :url, :string)
  end
end
