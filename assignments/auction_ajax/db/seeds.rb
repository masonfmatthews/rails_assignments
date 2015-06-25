# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Item.create(name: "Alpaca", description: "Cute.  Fluffy.  Comes with snow.",
    image_url: "http://hdwbin.com/wp-content/uploads/2014/10/alpaca-in-snow.jpg",
    starting_price: 125.00)

Item.create(name: "iPhone 4", description: "Used, white, 16GB, all original packaging and cables.",
    image_url: "http://cdn.theatlantic.com/static/mt/assets/science/iphone-4-white.jpg",
    starting_price: 9.99)

Item.create(name: "Nissan Leaf", description: "Silver, 38k miles, good condition.",
    image_url: "http://image.motortrend.com/f/wot/cheaper-ev-nissan-leaf-s-debuts-in-japan-with-lower-msrp-same-ev-performance-293735/55291499/revised-nissan-leaf-japanese-spec-brilliant-silver.jpg",
    starting_price: 12000)
