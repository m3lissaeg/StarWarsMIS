class Crew < ApplicationRecord
  validates :name,  presence: true
  has_and_belongs_to_many :droids
  has_and_belongs_to_many :rebels, class_name: "User", join_table: :crews_rebels
  has_and_belongs_to_many :passengers, class_name: "User", join_table: :crews_passengers
  
  belongs_to :ship  
  belongs_to :squad, optional: true

  validates_presence_of :droids, :rebels, :ship
  
end
