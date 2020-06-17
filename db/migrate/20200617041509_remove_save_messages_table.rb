class RemoveSaveMessagesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :save_messages
  end
end
