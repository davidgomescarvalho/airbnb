puts 'Creating Database....'
Review.destroy_all
Property.destroy_all


user = User.create!({
  email: 'david@gmail.com',
  password: '123456'
})


6.times do |i|
  property = Property.create!({
    name: Faker::Lorem.unique.sentence(word_count: 3),
    description: Faker::Lorem.paragraph(sentence_count: 10),
    headline: Faker::Lorem.sentence(word_count: 6),
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.street_name,
    city:   Faker::Address.city,
    state: Faker::Address.state,
    country: Faker::Address.country,
    price: Money.from_amount(rand(50..150), 'EUR')
  })

  property.images.attach(io: File.open("db/images/house-#{i + 1}.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/house-#{i + 7}.png"), filename: property.name)

  ((5..10).to_a.sample).times do
    Review.create!({
      content: Faker::Lorem.paragraph(sentence_count: 10),
      cleanliness_rating: rand(1..5),
      accuracy_rating: rand(1..5),
      checkin_rating: rand(1..5),
      communication_rating: rand(1..5),
      location_rating: rand(1..5),
      value_rating: rand(1..5),
      property: property,
      user: user
    })
  end
end

puts 'Database created!'
