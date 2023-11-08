class Prefecture < ApplicationRecord
  has_many :facilities
  validates :name, presence: true
end
