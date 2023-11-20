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

  scope :by_genre, ->(genre_id) { joins(:facility_genres).where(facility_genres: { genre_id: genre_id }) }
  scope :by_prefecture, ->(prefecture_id) { where(prefecture_id: prefecture_id) }
  scope :keywords_contain, ->(word) {
    where('name LIKE ?', "%#{word}%").or(
    where('description LIKE ?', "%#{word}%")).or(
    where('address LIKE ?', "%#{word}%")) }
end
