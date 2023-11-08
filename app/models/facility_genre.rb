class FacilityGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :facility
end
