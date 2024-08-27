puts 'Creating Database....'
Property.destroy_all

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
end

puts 'Database created!'
