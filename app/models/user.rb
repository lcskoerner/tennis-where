class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tennis_courts
  has_many :bookings
  validates :first_name, :last_name, :phone_number, presence: true
  has_one_attached :photo
end
