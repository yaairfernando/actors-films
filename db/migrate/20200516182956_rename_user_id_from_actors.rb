class RenameUserIdFromActors < ActiveRecord::Migration[6.0]
  def change
    rename_column :actors, :user_id, :creator_id
  end
end
