FactoryGirl.define do
  factory :article do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    price 20.5
    total_in_vault {rand(1..100)}
    total_in_shelf {rand(1..100)}
    store_id 1

    factory :invalid_article do
      name nil
    end
  end
end
