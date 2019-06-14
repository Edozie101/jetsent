class AddCurrencyToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :currency, :string
  end
end
