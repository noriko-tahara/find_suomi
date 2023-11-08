require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe 'ユーザー新規登録' do
    before do
      visit sign_up_path
    end

    describe 'フォームの入力値が正常' do
      it '登録に成功する' do
        fill_in 'user[name]', with: 'user'
        fill_in 'user[email]', with: 'test@example.com'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
        click_button I18n.t('defaults.register')
        expect(current_path).to eq login_path
        expect(page).to have_content I18n.t('users.create.success')
      end
    end

    describe 'フォームの入力値が異常' do
      context '名前' do
        it '未入力の場合、登録に失敗する' do
          fill_in 'user[name]', with: nil
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(current_path).to eq users_path
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content I18n.t('activerecord.errors.models.user.blank')
        end

        it '登録済の名前と入力値が重複している場合、登録に失敗する' do
          existing_user = create(:user)
          fill_in 'user[name]', with: existing_user.name
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(current_path).to eq users_path
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.name.taken')
        end

        it '入力値が20文字以上の場合、登録に失敗する' do
          fill_in 'user[name]', with: 'a' * 21
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(current_path).to eq users_path
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.name.too_long')
        end
      end

      context 'メールアドレス' do
        it '未入力の場合、登録に失敗する' do
          fill_in 'user[name]', with: 'user'
          fill_in 'user[email]', with: nil
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(current_path).to eq users_path
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content I18n.t('activerecord.errors.models.user.blank')
        end

        it '登録済のメールアドレスと入力値が重複している場合、登録に失敗する' do
          existing_user = create(:user)
          fill_in 'user[name]', with: 'user'
          fill_in 'user[email]', with: existing_user.email
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(current_path).to eq users_path
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.email.taken')
        end
      end

      context 'パスワード' do
        it '未入力の場合、登録に失敗する' do
          fill_in 'user[name]', with: 'user'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: nil
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(current_path).to eq users_path
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.password.too_short')
        end

        it '入力値が3文字以下の場合、登録に失敗する' do
          fill_in 'user[name]', with: 'user'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'a' * 2
          fill_in 'user[password_confirmation]', with: 'password'
          click_button I18n.t('defaults.register')
          expect(current_path).to eq users_path
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.password.too_short')
        end
      end

      context 'パスワード確認' do
        it '未入力の場合、登録に失敗する' do
          fill_in 'user[name]', with: 'user'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: nil
          click_button I18n.t('defaults.register')
          expect(current_path).to eq users_path
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content I18n.t('activerecord.errors.models.user.blank')
        end

        it '「パスワード」で入力したものと入力値が一致しない場合、登録に失敗する' do
          fill_in 'user[name]', with: 'user'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: 'password'
          fill_in 'user[password_confirmation]', with: 'abc'
          click_button I18n.t('defaults.register')
          expect(current_path).to eq users_path
          expect(page).to have_content I18n.t('users.create.fail')
          expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.password_confirmation.confirmation')
        end
      end
    end
  end
end
