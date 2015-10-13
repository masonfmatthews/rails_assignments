# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

t1 = Teacher.create!(name: "Mrs. Rollins", email: "rollins@mail.com", password: "rollinsisateacher")
t2 = Teacher.create!(name: "Mr. Fidel", email: "fidel@mail.com", password: "fidelisateacher")

s1 = Student.create!(name: "Ruti", email: "ruti@mail.com", teacher: t1)
