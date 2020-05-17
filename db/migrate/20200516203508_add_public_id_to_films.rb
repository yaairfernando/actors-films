class AddPublicIdToFilms < ActiveRecord::Migration[6.0]
  def change
    add_column :films, :public_id, :integer
  end
end
