5.times do
  store = Store.create!(
    name: Faker::Company.name,
    address: Faker::Address.street_address
  )
  2.times do
    Article.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: rand(100..200),
      total_in_vault: rand(1..100),
      total_in_shelf: rand(1..100),
      store_id: store.id
    )
  end
end