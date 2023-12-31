class Review < ApplicationRecord
  mount_uploader :review_image, ReviewImageUploader
  belongs_to :facility
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :body, presence: true, length: { maximum: 65_535 }
end
