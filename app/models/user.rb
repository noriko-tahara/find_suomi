class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_facilities, through: :bookmarks, source: :facility
  has_many :reviews, dependent: :destroy

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
end
