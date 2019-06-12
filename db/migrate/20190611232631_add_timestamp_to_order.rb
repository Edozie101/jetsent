class AddTimestampToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :created_on, :timestamp
  end
end
