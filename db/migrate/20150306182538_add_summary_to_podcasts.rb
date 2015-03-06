class AddSummaryToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :summary, :string
  end
end
