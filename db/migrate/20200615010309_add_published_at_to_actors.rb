class AddPublishedAtToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :published_at, :datetime
  end
end
