class Location < ApplicationRecord
    validates :system,  presence: true, length: { maximum: 50 }
    validates :coord,  presence: true, length: { maximum: 50 }

    has_many :missions
end
