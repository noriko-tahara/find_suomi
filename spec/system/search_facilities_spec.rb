require 'rails_helper'

RSpec.describe "SearchFacilities", type: :system do
  describe '施設検索機能' do
    let!(:facility) { create(:facility, name: 'Cafe Test') }
    let!(:facility_in_saitama) { create(:facility, :cafe_in_saitama, name: 'Cafe S') }
    let!(:facility_in_kamakura) { create(:facility, :kamakura, name: 'Cafe K') }
    let!(:facility_with_keyword_coffee) { create(:facility, :coffee, name: 'Great Coffee') }
    let!(:genre_cafe) { create(:genre) }
    let!(:genre_sauna) { create(:genre, :sauna) }
    let!(:facility_genre_cafe) { create(:facility_genre, facility:, genre: genre_cafe) }
    let!(:facility_genre_sauna) { create(:facility_genre, facility:, genre: genre_sauna) }
    before do
      visit root_path
    end

    context 'ジャンル・地域別検索' do
      it 'ジャンルを選択して検索できる' do
        within 'select[name="q[genre_id]"]' do
          select 'カフェ'
        end
        click_button '検索', match: :first
        expect(page).to have_content(facility.name)
      end

      it '地域を選択して検索できる' do
        within 'select[name="q[prefecture_id]"]' do
          select '埼玉県'
        end
        click_button '検索', match: :first
        expect(page).to have_content(facility_in_saitama.name)
      end

      it 'ジャンルと地域を選択して検索できる' do
        within 'select[name="q[genre_id]"]' do
          select '食品'
        end
        within 'select[name="q[prefecture_id]"]' do
          select '神奈川県'
        end
        click_button '検索', match: :first
        expect(page).to have_content(facility_in_kamakura.name)
      end
    end

    context 'キーワード検索' do
      it '施設名で検索できる' do
        fill_in('q[name]', with: 'Test')
        click_button 'keyword_search'
        expect(page).to have_content(facility.name)
      end

      it '住所で検索できる' do
        fill_in('q[name]', with: '鎌倉')
        click_button 'keyword_search'
        expect(page).to have_content(facility_in_kamakura.name)
      end

      it '施設紹介文に該当する単語で検索できる' do
        fill_in('q[name]', with: 'コーヒー')
        click_button 'keyword_search'
        expect(page).to have_content(facility_with_keyword_coffee.name)
      end

      it '複数単語(住所と紹介文に該当する語)で検索できる' do
        fill_in('q[name]', with: 'コーヒー 荻窪')
        click_button 'keyword_search'
        expect(page).to have_content(facility_with_keyword_coffee.name)
      end
    end
  end
end
