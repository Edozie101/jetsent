class CreateConfirmations < ActiveRecord::Migration[5.2]
  def change
    create_table :confirmations do |t|
      t.references :order, foreign_key: true
      t.string :price
      t.string :currency

      t.timestamps
    end
  end
end
