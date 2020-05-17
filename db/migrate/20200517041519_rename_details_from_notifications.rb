class RenameDetailsFromNotifications < ActiveRecord::Migration[6.0]
  def change
    rename_column :notifications, :model_name, :m_name
    rename_column :notifications, :model_id, :m_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
