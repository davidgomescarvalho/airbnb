Property.destroy_all

Property.create!({
  name: "Sample Property",
  description: "This is a sample property",
  headline: "Sample Property",
  address_1: "1234 Sample St",
  address_2: "Unit 1",
  city: "Sample City",
  state: "CA",
  country: "US",
})

Property.create!({
  name: "Sample Property 2",
  description: "This is a sample property 2",
  headline: "Sample Property 2",
  address_1: "50 Sample St",
  address_2: "Unit 1",
  city: "Brooklyn",
  state: "NY",
  country: "US",
})

Property.create!({
  name: "Sample Property 3",
  description: "This is a sample property 3",
  headline: "Sample Property 3",
  address_1: "12 Sample St",
  address_2: "Unit 1",
  city: "Boston",
  state: "MA",
  country: "US",
})
