class AddMemoToWithdrawals < ActiveRecord::Migration
  def change
    add_column :withdrawals, :memo, :string
  end
end
