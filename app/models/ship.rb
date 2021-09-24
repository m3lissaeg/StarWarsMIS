class Ship < ApplicationRecord
    validates :name,  presence: true, length: { maximum: 50 }
    has_many :crews, :dependent => :destroy
end
