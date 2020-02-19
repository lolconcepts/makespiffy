class AddStuffToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :telephone, :string
    add_column :users, :sms_ok, :boolean, default: false
    add_reference :users, :carrier, foreign_key: true
  end
  def down
  	remove_column :users, :telephone
    remove_column :users, :sms_ok
    remove_reference :users, :carrier
  end
end
