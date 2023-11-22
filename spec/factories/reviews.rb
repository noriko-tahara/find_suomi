FactoryBot.define do
  factory :review do
    sequence(:body) { |n| "review_#{n}" }
    association :facility
    association :user
  end
end
