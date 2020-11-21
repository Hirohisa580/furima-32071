FactoryBot.define do
  factory :item do
    name                {Faker::Lorem.sentence}
    explanation         {Faker::Lorem.sentence}
    category_id         {2}
    status_id           {2}
    shipping_id         {2}
    area_id             {2}
    days_id             {2}
    price               {5000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
