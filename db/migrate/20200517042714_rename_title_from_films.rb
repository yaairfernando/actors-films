class RenameTitleFromFilms < ActiveRecord::Migration[6.0]
  def change
    rename_column :films, :title, :name
  end
end
