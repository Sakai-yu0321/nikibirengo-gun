FactoryBot.define do
  factory :post do
    title       { Faker::Name.initials }
    text        { Faker::Lorem.paragraphs }
    category_id { 2 }
    association :user
  end
end
