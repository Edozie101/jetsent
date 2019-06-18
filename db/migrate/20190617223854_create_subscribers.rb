class CreateSubscribers < ActiveRecord::Migration[5.2]
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :state

      t.timestamps
    end
  end
end
