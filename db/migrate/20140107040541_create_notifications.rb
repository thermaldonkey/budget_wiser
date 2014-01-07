class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :body
      t.boolean :read
      t.references :user

      t.timestamps
    end
    add_index :notifications, :user_id
  end
end
