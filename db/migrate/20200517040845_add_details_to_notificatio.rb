class AddDetailsToNotificatio < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :model_name, :string
    add_column :notifications, :model_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
