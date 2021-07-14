class Droid < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 50 }
    validates :model,  presence: true, length: { maximum: 50 }
end
