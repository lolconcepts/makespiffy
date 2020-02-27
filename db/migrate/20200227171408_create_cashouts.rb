class CreateCashouts < ActiveRecord::Migration[5.2]
  def up
    create_table :cashouts do |t|
      t.references :user, foreign_key: true
      t.string :amount
      t.boolean :paid, default: false

      t.timestamps
    end
  end
  def down
  	drop_table :cashouts
  end
end
