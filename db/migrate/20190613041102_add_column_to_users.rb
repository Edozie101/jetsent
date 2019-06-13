class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :auth_key, :string
  end
end
