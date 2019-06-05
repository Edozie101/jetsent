class AddNameAndWebsiteToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :name, :string
    add_column :orders, :website, :string
    add_column :orders, :image, :string
    add_column :orders, :price, :string
    add_column :orders, :pickup_location, :string
    add_column :orders, :drop_off_location, :string
  end
end
