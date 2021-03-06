class Droid < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 50 }
    validates :model,  presence: true, length: { maximum: 50 }

    has_and_belongs_to_many :crews
end
