class AddMemoToDeductions < ActiveRecord::Migration
  def change
    add_column :deductions, :memo, :string
  end
end
