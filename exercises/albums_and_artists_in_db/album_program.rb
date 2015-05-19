require "./album.rb"
require "./artist.rb"

thriller = Album.new("Thriller", 0.50, 300)
rush = Album.new("Rush", 5.00, 100)

# 300
puts thriller.count

thriller.buy(5)

# 295
puts thriller.count

mj = Artist.new("MJ")

# "MJ"
puts mj.name

mj.assign(thriller)
mj.assign(rush)

# "Thriller, Rush"
p mj.album_names

mj.discount_catalog(50)

# 0.25
puts thriller.price
# 2.5
puts rush.price
