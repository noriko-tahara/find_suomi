class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_facilities, through: :bookmarks, source: :facility
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_reviews, through: :likes, source: :review

  validates :name, uniqueness: true, presence: true, length: { maximum: 20 }
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

  enum role: { general: 0, admin: 1 }

  def bookmark(facility)
    bookmark_facilities << facility
  end

  def unbookmark(facility)
    bookmark_facilities.destroy(facility)
  end

  def bookmark?(facility)
    bookmark_facilities.include?(facility)
  end

  def own?(object)
    id == object.user_id
  end

  def like(review)
    like_reviews << review
  end

  def unlike(review)
    like_reviews.destroy(review)
  end

  def like?(review)
    like_reviews.include?(review)
  end
end
