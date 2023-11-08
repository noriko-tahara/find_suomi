class Facility < ApplicationRecord
  belongs_to :prefecture

  has_many :bookmarks, dependent: :destroy
  has_many :facility_genres, dependent: :destroy
  has_many :genres, through: :facility_genres

  validates :name, presence: true
  validates :address, presence: true
end
