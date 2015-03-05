class DropTables < ActiveRecord::Migration
  def change
    drop_table :post_tags
    drop_table :tags
  end
end
