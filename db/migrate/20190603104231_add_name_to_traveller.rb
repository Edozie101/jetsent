class AddNameToTraveller < ActiveRecord::Migration[5.2]
  def change
    add_column :travellers, :name, :string
  end
end
