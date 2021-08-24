class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  validates :name,  presence: true
  validates :phone,  presence: true, length: { maximum: 100 }
  validates :email,  presence: true

  has_and_belongs_to_many :crews, join_table: :crews_rebels
end
