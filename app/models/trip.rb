class Trip < ApplicationRecord
    belongs_to :user, inverse_of: :trip
    validates :date, presence: true




end
