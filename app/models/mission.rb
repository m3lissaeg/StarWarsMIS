class Mission < ApplicationRecord
  belongs_to :commander, class_name: "User"
  belongs_to :location
  enum status: [ :planning, :in_progress, :success , :failure ]
end
