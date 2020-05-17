class AddPublicIdToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :public_id, :string
  end
end
