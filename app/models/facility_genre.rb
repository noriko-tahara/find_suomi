class FacilityGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :facility

  validates :genre_id, presence: true
  validates :facility_id, presence: true
end
