class TennisCourt < ApplicationRecord
  belongs_to :user
  validates :name, :address, :price_per_hour, presence: true
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
