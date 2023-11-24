class Review < ApplicationRecord
  belongs_to :facility
  belongs_to :user

  validates :body, presence: true, length: { maximum: 65_535 }
end
