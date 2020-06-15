class AddReadAtToNotifications < ActiveRecord::Migration[6.0]
  def change
    add_column :notifications, :readt_at, :datetime
  end
end
