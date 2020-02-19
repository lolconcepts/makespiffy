class AddStuffToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :avatar, :string
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :admin, :boolean, default: false
  end

  def down
  	remove_column :users, :avatar
    remove_column :users, :fname
    remove_column :users, :lname
    remove_column :users, :admin
  end

end
