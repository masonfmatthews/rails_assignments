# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  Group.create!(name: Faker::Team.name)
  c = Client.create!(name: Faker::Company.name,
      industry: Faker::Commerce.department)
  3.times do
    Comment.create!(subject_id: c.id,
        subject_type: "Client",
        developer_id: rand(50)+1,
        comment: Faker::Company.bs)
    p = Project.create!(name: Faker::Commerce.product_name,
        started_on: Faker::Date.backward(1000),
        client_id: c.id)
    Comment.create!(subject_id: p.id,
        subject_type: "Project",
        developer_id: rand(50)+1,
        comment: Faker::Company.bs)
  end
end

50.times do
  d = Developer.create!(name: Faker::Name.name,
      email: Faker::Internet.email,
      joined_on: Faker::Date.backward(1000))
  ProjectAssignment.create(developer_id: d.id,
      project_id: rand(10)+1)
  GroupAssignment.create(developer_id: d.id,
      group_id: rand(10)+1)
  10.times do
    TimeEntry.create(developer_id: d.id,
        project_id: rand(30)+1,
        duration: (rand(80)+1)/10,
        worked_on: Faker::Date.backward(365))
  end
end
