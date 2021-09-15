class Mission < ApplicationRecord
  belongs_to :commander, class_name: "User"
  belongs_to :location
  enum status: [ :planning, :in_progress, :success , :failure ]

  has_many :squads, :dependent => :destroy

  validates :start_date, :end_date, :status, :commander_id, :location_id,  presence: true
  
end
