class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :items, array: true
      t.references :traveller, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :confirmed

      t.timestamps
    end
  end
end
