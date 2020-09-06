class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tennis_court
  validates :content, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
