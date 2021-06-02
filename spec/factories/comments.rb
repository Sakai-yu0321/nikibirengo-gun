FactoryBot.define do
  factory :comment do
    text        { Faker::Lorem.paragraphs }
    association :user
    association :post
  end
end
