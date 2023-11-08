class Genre < ApplicationRecord
  has_many :facility_genres, dependent: :destroy, foreign_key: 'genre_id'
  has_many :facilities, through: :facility_genres

  validates :name, uniqueness: true
end
