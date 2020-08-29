class Review < ApplicationRecord
  belongs_to :user
  belongs_to :tennis_court

  validates :content, presence: true
end
