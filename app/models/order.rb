class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :traveller, class_name: "User", foreign_key: :traveller_id, optional: true

  confirmed = ["unconfirmed","on_display","confirmed"]
end
