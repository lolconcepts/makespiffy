class AddBankToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :bank, :integer, default: 0
  end
  def down
  	remove_column :users, :bank
  end
end
