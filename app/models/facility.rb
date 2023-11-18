class Facility < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :prefecture

  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks
  has_many :facility_genres, dependent: :destroy
  has_many :genres, through: :facility_genres

  validates :name, presence: true
  validates :address, presence: true
end
