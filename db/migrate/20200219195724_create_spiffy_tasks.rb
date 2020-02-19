class CreateSpiffyTasks < ActiveRecord::Migration[5.2]
  def up
    create_table :spiffy_tasks do |t|
      t.string :name
      t.text :description
      t.string :value
      t.boolean :active, default: true

      t.timestamps
    end
  end
  def down
  	drop_table :spiffy_tasks
  end
end
