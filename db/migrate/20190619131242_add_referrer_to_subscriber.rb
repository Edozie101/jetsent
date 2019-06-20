class AddReferrerToSubscriber < ActiveRecord::Migration[5.2]
  def change
    add_reference :subscribers, :referrer, foreign_key: {to_table: :subscribers}
  end
end
