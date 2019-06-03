class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :website
      t.string :loc
      t.string :price

      t.timestamps
    end
  end
end