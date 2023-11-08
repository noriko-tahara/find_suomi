require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  let(:user) { create(:user) }

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        visit login_path
        fill_in User.human_attribute_name(:email), with: user.email
        fill_in User.human_attribute_name(:password), with: 'password'
        click_button I18n.t('defaults.login')
        expect(current_path).to eq root_path
        expect(page).to have_content I18n.t('user_sessions.create.success')
      end
    end

    context 'メールアドレスが未入力' do
      it 'ログイン処理が失敗する' do
        visit login_path
        fill_in User.human_attribute_name(:email), with: nil
        fill_in User.human_attribute_name(:password), with: 'password'
        click_button I18n.t('defaults.login')
        expect(current_path).to eq login_path
        expect(page).to have_content I18n.t('user_sessions.create.fail')
      end
    end

    context 'パスワードが未入力' do
      it 'ログイン処理が失敗する' do
        visit login_path
        fill_in User.human_attribute_name(:email), with: user.email
        fill_in User.human_attribute_name(:password), with: nil
        click_button I18n.t('defaults.login')
        expect(current_path).to eq login_path
        expect(page).to have_content I18n.t('user_sessions.create.fail')
      end
    end
  end

  describe 'ログイン後' do
    before { login(user) }

      context 'ログアウトボタンをクリック' do
        it 'ログアウト処理が成功する' do
          visit root_path
          click_link I18n.t('defaults.logout')
          expect(current_path).to eq root_path
          expect(page).to have_content I18n.t('user_sessions.destroy.success')
        end
      end
  end

end
