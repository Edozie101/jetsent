class AddShippingFeeToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :shipper_fee, :string
  end
end
