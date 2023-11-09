class Genre < ApplicationRecord
  has_many :facility_genres, dependent: :destroy
  has_many :facilities, through: :facility_genres

  validates :name, uniqueness: true, presence: true
end
