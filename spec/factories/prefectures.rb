FactoryBot.define do
  factory :prefecture do
    name { "東京都" }

    trait :kanagawa do
      name {"神奈川県"}
    end

    trait :saitama do
      name {"埼玉県"}
    end
  end
end
