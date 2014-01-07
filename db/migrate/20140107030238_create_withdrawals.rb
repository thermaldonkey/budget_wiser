class CreateWithdrawals < ActiveRecord::Migration
  def change
    create_table :withdrawals do |t|
      t.float :value, null: false
      t.references :pay_period 

      t.timestamps
    end
  end
end
