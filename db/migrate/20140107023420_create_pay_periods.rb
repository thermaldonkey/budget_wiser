class CreatePayPeriods < ActiveRecord::Migration
  def change
    create_table :pay_periods do |t|
      t.float :gross_income, null: false
      t.float :net_income
      t.float :savings
      t.date :end_date, null: false
      t.date :start_date, null: false
      t.references :user

      t.timestamps
    end
  end
end
