class Squad < ApplicationRecord
  validates :name,  presence: true

  has_and_belongs_to_many :crews
  belongs_to :leader, class_name: "User"

  validates_presence_of :crews, :leader
end
