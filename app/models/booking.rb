class Booking < ApplicationRecord
  belongs_to :tennis_court
  belongs_to :user
end
