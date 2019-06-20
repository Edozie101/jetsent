class Subscriber < ApplicationRecord
    belongs_to :referrer, class_name: "Subscriber", foreign_key: :referrer_id, optional: true
end
