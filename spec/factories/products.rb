FactoryBot.define do
  factory :product do
    name { Faker::Lorem.sentence }
    image { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    association :user
    category_id { 2 }
    status_id { 2 }
    shipping_cost_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    price { 5000 }

    after(:build) do |product|
      product.image.attach(io: File.open('spec/factories/enru.png'), filename: 'enru.png')
    end
  end
end
