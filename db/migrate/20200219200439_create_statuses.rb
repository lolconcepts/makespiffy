class CreateStatuses < ActiveRecord::Migration[5.2]
  def up
    create_table :statuses do |t|
      t.string :name

      t.timestamps
    end
    Status.create(:name => "New")
    Status.create(:name => "Complete")
    Status.create(:name => "Verified")
    Status.create(:name => "Paid")
    Status.create(:name => "Rejected")
  end
  def down
  	drop_table :statuses
  end
end
