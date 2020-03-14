class CreateBonus < ActiveRecord::Migration[5.2]
  def up
    create_table :bonus do |t|
      t.references :user, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
  def down
  	remove_table :bonus
  end
end
