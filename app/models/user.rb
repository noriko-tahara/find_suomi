class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_facilities, through: :bookmarks, source: :facility

  validates :name, uniqueness: true, presence: true, length: { maximum: 20 }
  validates :email, uniqueness: true, presence: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }

  def bookmark(facility)
    bookmark_facilities << facility
  end

  def unbookmark(facility)
    bookmark_facilities.destroy(facility)
  end

  def bookmark?(facility)
    bookmark_facilities.include?(facility)
  end
end
