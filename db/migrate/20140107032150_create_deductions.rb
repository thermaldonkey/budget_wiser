class CreateDeductions < ActiveRecord::Migration
  def change
    create_table :deductions do |t|
      t.float :value
      t.integer :monthly_frequency
      t.references :user

      t.timestamps
    end
    add_index :deductions, :user_id
  end
end
