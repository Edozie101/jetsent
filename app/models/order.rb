class Order < ApplicationRecord
  belongs_to :traveller
  belongs_to :user
end
