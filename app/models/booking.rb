class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tennis_court
end
