# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

now = Time.now
today = Date.today

assembly_count = 100
sequence_count = 10000
gene_count = 50000
hit_count = 500000

puts_interval = 100

dna_characters = ["A", "C", "T", "G"]

dna_string = ""
1500.times do
  dna_string << dna_characters.sample
end

assembly_count.times do |i|
  Assembly.create!(run_on: today - rand(100).days,
    name: "a#{i+1}")
  puts "Assembly #{i+1} done" if (i+1) % puts_interval == 0
end

sequence_count.times do |i|
  Sequence.create!(assembly_id: rand(assembly_count) + 1,
    dna: dna_string[rand(700)..(-1*rand(700))],
    quality: Faker::Lorem.characters(10))
  puts "Sequence #{i+1} done" if (i+1) % puts_interval == 0
end

gene_count.times do |i|
  Gene.create!(sequence_id: rand(sequence_count) + 1,
    dna: dna_string[rand(700)..(-1*rand(700))],
    starting_position: rand(100),
    direction: rand(2)==1)
  puts "Gene #{i+1} done" if (i+1) % puts_interval == 0
end

hit_count.times do |i|
  Hit.create!(subject_id: rand(gene_count) + 1,
      subject_type: "Gene",
      match_gene_name: Faker::Lorem.word,
      match_gene_dna: dna_string[rand(700)..(-1*rand(700))],
      percent_similarity: rand(100))
  puts "Hit #{i+1} done" if (i+1) % puts_interval == 0
end

puts "Completed running in #{Time.now-now} seconds."
