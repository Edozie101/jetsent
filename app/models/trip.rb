class Trip < ApplicationRecord
    belongs_to :user, inverse_of: :trips
    validates :date, presence: true




end
