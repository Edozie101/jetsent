class AddTravellerIdToUser < ActiveRecord::Migration[5.2]
  def change
    # add_column :users, :traveller_id, :integer, index: true
    # add_index :users, :traveller_id, :unique => true
  end
end
