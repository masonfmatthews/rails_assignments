# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

voter = Voter.create(name: "Mason", party: "Friday")
candidate = Candidate.create(name: "Anthony for President", party: "All")
vote = Vote.create(voter: voter, candidate: candidate)
