FactoryBot.define do
  factory :review do
    sequence(:body) { |n| "review_#{n}" }
    facility
    user
  end
end
