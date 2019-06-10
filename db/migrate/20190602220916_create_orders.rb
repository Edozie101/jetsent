class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :items, array: true
      t.references :user, foreign_key: true
      t.datetime :remember_created_at
      t.string :confirmed, default: "unconfirmed"

      t.timestamps
    end
  end
end
