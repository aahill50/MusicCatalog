# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# (1..10).each do |i|
#   eml, pw = "user#{i}@example.com", i.to_s
#
#   User.create!(email: eml, password: pw)
# end

b = Band.new(name: "Test Band")
a1 = b.albums.new(name: "Album A")
a2 = b.albums.new(name: "Album B")
t1 = a1.tracks.new(name: "Track 1a")
t2 = a1.tracks.new(name: "Track 2a")
t3 = a2.tracks.new(name: "Track 1b")
t4 = a2.tracks.new(name: "Track 2b")
b.save

