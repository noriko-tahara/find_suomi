class Prefecture < ApplicationRecord
  has_many :facilities
  validates :name, presence: true

  scope :selected_prefectures, -> { where(name: %w[東京都 神奈川県 埼玉県 千葉県]) }
end
