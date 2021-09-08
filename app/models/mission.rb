class Mission < ApplicationRecord
  belongs_to :commander, class_name: "User"
  belongs_to :location
  enum status: [ :planning, :in_progress, :success , :failure ]

  validates :start_date, :end_date, :status, :commander_id, :location_id,  presence: true
  
end
