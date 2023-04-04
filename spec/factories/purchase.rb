FactoryBot.define do
  factory :purchase do
    post_code      {"111-1111"}
    prefecture_id     {2}
    city_name             {"札幌市"}
    address          {"青葉区1-1-1"}
    building_name       {"柳ビル101"}
    phone_number        {"08011111111"}
    token {"tok_abcdefghijk00000000000000000"}
    
    association :user_id
    association :product_id
  end
end