puts 'Creating Database....'
Review.destroy_all
Property.destroy_all
User.destroy_all


description = <<-DESCRIPTION

DESCRIPTION
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
    price: Money.from_amount(rand(50..150), 'EUR'),
    bedroom_count: (2..5).to_a.sample,
    bed_count: (4..10).to_a.sample,
    guest_count: (4..20).to_a.sample,
    bathroom_count: (1..4).to_a.sample
  })

  property.images.attach(io: File.open("db/images/house-#{i + 1}.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/house-7.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/house-8.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/house-9.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/house-10.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/house-11.png"), filename: property.name)
  property.images.attach(io: File.open("db/images/house-12.png"), filename: property.name)

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
