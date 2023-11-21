FactoryBot.define do
  factory :genre do
    name { "カフェ" }

    trait :sauna do
      name { "サウナ" }
    end
  end
end
