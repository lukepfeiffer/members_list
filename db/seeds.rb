puts "Creating users"

30.times do
  email = Faker::Internet.free_email
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  age = rand(18..28)
  User.create(
    first_name: first_name,
    last_name: last_name,
    age: age,
    email: email
  )
end
