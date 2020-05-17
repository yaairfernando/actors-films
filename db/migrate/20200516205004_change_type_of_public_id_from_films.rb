class ChangeTypeOfPublicIdFromFilms < ActiveRecord::Migration[6.0]
  def change
    change_column :films, :public_id, :string
  end
end
