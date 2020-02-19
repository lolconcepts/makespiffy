class CreateChores < ActiveRecord::Migration[5.2]
  def up
    create_table :chores do |t|
      t.references :spiffy_task, foreign_key: true
      t.string :evidence
      t.references :status, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
  def down
  	drop_table :chores
  end
end
