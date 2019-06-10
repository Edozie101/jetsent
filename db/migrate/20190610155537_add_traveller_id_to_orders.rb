class AddTravellerIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :traveller,  foreign_key: {to_table: :users}
  end
end
