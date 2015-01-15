array = []
array << "Alice"
array << "Bob"
array << "Carla"
array << "Don"
array << "Elise"
array << "Fred"

puts "Enter a name, and this program will tell you if that person is in your class."
input = gets.chomp
found = false
array.each do |name|
  found = true if name == input
end

if found == true
  puts "Yes!  This person is in your class."
else
  puts "No.  This person is not in your class."
end
