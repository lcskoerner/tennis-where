class TennisCourt < ApplicationRecord
  belongs_to :user
  validates :name, :address, :price_per_hour, presence: true
end