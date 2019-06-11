class UpdateForeignKeyInOrders < ActiveRecord::Migration[5.2]
  def change
        #remove foreign key from orders
        # remove_foreign_key(:orders, :users)
        # #add new foreign key to orders
        # add_foreign_key(:orders, :users, {:on_delete=>:cascade})
  end
end
