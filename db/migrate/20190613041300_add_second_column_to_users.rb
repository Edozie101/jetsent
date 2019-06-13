class AddSecondColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :notif_id, :integer
  end
end
