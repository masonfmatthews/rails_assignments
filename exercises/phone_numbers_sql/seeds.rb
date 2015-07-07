last_names = ["Smith"]

15.times do
  last_names << Faker::Name.last_name
end

1000.times do
  Person.create!(first_name: Faker::Name.first_name,
      last_name: last_names.sample)
end

2000.times do
  PhoneNumber.create!(person_id: rand(1000)+1,
      phone_type: ["Mobile", "Home", "Work"].sample,
      phone_number: Faker::PhoneNumber.phone_number)
  EmailAddress.create!(person_id: rand(1000)+1,
      email_address: Faker::Internet.email)
end
