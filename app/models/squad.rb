class Squad < ApplicationRecord
  validates :name,  presence: true

  has_many :crews, :dependent => :destroy
  belongs_to :leader, class_name: "User"
  belongs_to :mission

  validates_presence_of :leader
end
