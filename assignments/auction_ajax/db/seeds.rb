# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.create(name: "Alpaca", description: "Cute.  Fluffy.  Comes with snow.",
    image_url: "http://www.aghistoryproject.org/wp-content/uploads/2013/11/Alpaca-In-Snow.jpg",
    starting_price: 125.00)
