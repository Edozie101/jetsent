class AddColumnToConfirmation < ActiveRecord::Migration[5.2]
  def change
    add_reference :confirmations, :user, foreign_key: true
  end
end
