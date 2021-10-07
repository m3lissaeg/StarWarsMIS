class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,# :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  validates :name,  presence: true
  validates :phone,  presence: true, length: { maximum: 100 }
  validates :email,  presence: true

  has_and_belongs_to_many :crews_as_rebel, class_name: "Crew", join_table: :crews_rebels
  has_and_belongs_to_many :crews_as_passenger, class_name: "Crew", join_table: :crews_passengers

  has_many :squads, foreign_key: "leader_id", dependent: :nullify
  has_many :missions, foreign_key: "commander_id", dependent: :nullify
end
