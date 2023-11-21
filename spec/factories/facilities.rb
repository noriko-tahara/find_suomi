FactoryBot.define do
  factory :facility do
    sequence(:name) { |n| "施設-#{n}" }
    sequence(:description) {|n| "おすすめ施設-#{n}"}
    address {"東京都渋谷区神宮前5-46-7"}
    prefecture

    trait :cafe_in_saitama do
      sequence(:name) { |n| "施設-#{n}" }
      sequence(:description) {|n| "おすすめ施設-#{n}"}
      address {"埼玉県飯能市宮沢327-6"}
      prefecture { create(:prefecture, :saitama) }
    end

    trait :coffee do
      sequence(:name) { |n| "facility-#{n}" }
      description { "こだわりのコーヒーが美味しいお店。" }
      address { "東京都杉並区荻窪5-16-20" }
    end

    trait :kamakura do
      sequence(:name) { |n| "facility-#{n}" }
      address { "神奈川県鎌倉市小町2-8-23" }
      prefecture { create(:prefecture, :kanagawa) }

      transient do
        genre_name { "食品" }
      end

      after(:build) do |facility, evaluator|
        facility.genres << create(:genre, name: evaluator.genre_name)
      end
    end
  end
end
