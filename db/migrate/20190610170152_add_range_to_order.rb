class AddRangeToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :preferred_date_start, :date
    add_column :orders, :preferred_date_end, :date
  end
end
