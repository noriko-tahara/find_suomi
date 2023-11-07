require 'rails_helper'

RSpec.describe User do
  describe 'バリデーション' do
    describe '正常系' do
      it '名前、メールアドレス、パスワード、パスワード確認の入力内容が有効' do
        user = build(:user)
        expect(user).to be_valid
        expect(user.errors).to be_empty
      end
    end

    describe '異常系' do
      context 'nameカラム' do
        it '名前の入力が無い場合、無効' do
          user_without_name = build(:user, name: '')
          expect(user_without_name).not_to be_valid
          expect(user_without_name.errors[:name]).to eq [I18n.t('activerecord.errors.models.user.blank')]
        end

        it '名前が重複している場合、無効' do
          user = create(:user)
          user_with_duplicated_name = build(:user, name: user.name)
          expect(user_with_duplicated_name).not_to be_valid
          expect(user_with_duplicated_name.errors[:name]).to eq [I18n.t('activerecord.errors.models.user.attributes.name.taken')]
        end

        it '名前の入力が20文字以上の場合、無効' do
          user_with_too_long_name = build(:user, name: 'a' * 21)
          expect(user_with_too_long_name).not_to be_valid
          expect(user_with_too_long_name.errors[:name]).to eq [I18n.t('activerecord.errors.models.user.attributes.name.too_long')]
        end
      end

      context 'emailカラム' do
        it 'メールアドレスの入力が無い場合、無効' do
          user_without_email = build(:user, email: '')
          expect(user_without_email).not_to be_valid
          expect(user_without_email.errors[:email]).to eq [I18n.t('activerecord.errors.models.user.blank')]
        end

        it 'メールアドレスが重複している場合、無効' do
          user = create(:user)
          user_with_duplicated_email = build(:user, email: user.email)
          expect(user_with_duplicated_email).not_to be_valid
          expect(user_with_duplicated_email.errors[:email]).to eq [I18n.t('activerecord.errors.models.user.attributes.email.taken')]
        end
      end

      context 'passwordカラム' do
        it 'パスワードの入力が無い場合、無効' do
          user_without_password = build(:user, password: '')
          expect(user_without_password).not_to be_valid
          expect(user_without_password.errors[:password]).to eq [I18n.t('activerecord.errors.models.user.attributes.password.too_short')]
        end

        it 'パスワードの入力が3文字以下の場合、無効' do
          user_with_too_short_password = build(:user, password: 'a' * 2)
          expect(user_with_too_short_password).not_to be_valid
          expect(user_with_too_short_password.errors[:password]).to eq [I18n.t('activerecord.errors.models.user.attributes.password.too_short')]
        end
      end

      context 'password_confirmationカラム' do
        it 'パスワード確認の入力が無い場合、無効' do
          user_without_password_confirmation = build(:user, password_confirmation: '')
          expect(user_without_password_confirmation).not_to be_valid
          expect(user_without_password_confirmation.errors[:password_confirmation]).to eq [I18n.t('activerecord.errors.models.user.blank'), I18n.t('activerecord.errors.models.user.attributes.password_confirmation.confirmation')]
        end

        it '「パスワード」で入力したものと内容が一致しない場合、無効' do
          user_with_unmatched_password = build(:user, password: 'abc', password_confirmation: '123')
          expect(user_with_unmatched_password).not_to be_valid
          expect(user_with_unmatched_password.errors[:password_confirmation]).to eq [I18n.t('activerecord.errors.models.user.attributes.password_confirmation.confirmation')]
        end
      end
    end
  end
end
