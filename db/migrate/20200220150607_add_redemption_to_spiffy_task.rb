class AddRedemptionToSpiffyTask < ActiveRecord::Migration[5.2]
  def up
    add_column :spiffy_tasks, :redemptions, :integer, :default => 1
  end
  def down
  	remove_column :spiffy_tasks, :redemptions
  end
end
