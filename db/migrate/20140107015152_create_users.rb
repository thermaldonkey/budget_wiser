class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :pay_days, array: true, default: '{}'
      t.float :allowance, null: false
      t.float :pending_payment

      t.timestamps
    end
  end
end
