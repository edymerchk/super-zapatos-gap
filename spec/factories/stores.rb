FactoryGirl.define do
  factory :store do
    name { Faker::Company.name }
    address { Faker::Address.street_address }

    factory :invalid_store do
      name nil
    end
  end
end
