require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'バリデーション' do
    context '正常系' do
      it '全ての入力内容が有効' do
        review = build(:review)
        expect(review).to be_valid
      end
    end

    context '異常系' do
      it '本文の入力が無い場合、無効' do
        review = build(:review, body: nil)
        expect(review).not_to be_valid
        expect(review.errors[:body]).to eq [I18n.t('activerecord.errors.models.review.blank')]
      end

      it '本文が65536文字以上の場合、無効' do
        review = build(:review, body: 'a' * 65_536)
        expect(review).not_to be_valid
        expect(review.errors[:body]).to eq [I18n.t('activerecord.errors.models.review.attributes.body.too_long')]
      end
    end
  end
end
