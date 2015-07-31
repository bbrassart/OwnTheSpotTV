# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Skater.all.destroy_all
Spot.all.destroy_all
Video.all.destroy_all

spots = [
  Spot.create!(name: "Plaça Universitat", description: "Marble ledges everywhere, perfect flatground, best SKATE game spot, lines for days", district: 'Eixample'),
  Spot.create!(name: 'Macba', description: "The one and only Macba, the dream spot, ledges, stairs, gaps, all you need to prove your skills", district: 'Raval'),
  Spot.create!(name: 'Macba downhill', description: "This spot is located between Plaça Universitat and the Macba. A very funny little downhill with banks and little curbs. Getcha slappy on!", district: 'Raval'),
  Spot.create!(name: 'Mercat de las Flors', description: "Probably the best ledge in Barcelona. Perfect to practice your ledge skills", district: 'Poble Sec'),
  Spot.create!(name: 'Arc de Triomf', description: 'Another perfect spot in Barcelona', district: 'Fort Pienc'),
  Spot.create!(name: 'Parc de la Ciutadella', description: 'Awesome manny pad, chillout atmosphere, sunday spot', district: 'Fort Pienc'),
  Spot.create!(name: 'Montbau manual pad', description: 'Little stair up, long manny and a bank to go down, the way to go', district: 'Montbau'),
  Spot.create!(name: 'Montbau downhill', description: 'Try to get the perfect line at this difficult spot', district: 'Montbau'),
  Spot.create!(name: 'Hostafrancs', description: 'Stairs for days, a big handrail and a big flatground space', district: 'Sants')
]

skaters = [
  Skater.create!(username: 'Richie', email: 'richard.william.roberts@gmail.com', password: 'richierichie', password_confirmation: 'richierichie', stance: 'goofy'),
  Skater.create!(username: 'Baptiste', email: 'baptiste.brassart@gmail.com', password: 'baptistebaptiste', password_confirmation: 'baptistebaptiste', stance: 'regular'),
  Skater.create!(username: 'Usher', email: 'usher@gmail.com', password: 'usherusher', password_confirmation: 'usherusher', stance: 'goofy'),
  Skater.create!(username: 'Damingo', email: 'blackout@hotmail.fr', password: 'damingodamingo', password_confirmation: 'damingodamingo', stance: 'regular'),
  Skater.create!(username: 'Gavin', email: 'gavin@gmail.com', password: 'gavingavin', password_confirmation: 'gavingavin', stance: 'regular')
]

categories = [
  'trick',
  'line',
  'slam'
]

videos = [
  Video.create!(url: 'https://www.youtube.com/watch?v=aT_yFSUbbVw', skater_id: skaters[0].id, spot_id: spots[0].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://www.youtube.com/watch?v=XR3vgu_WeZM', skater_id: skaters[1].id, spot_id: spots[2].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://www.youtube.com/watch?v=1rvZVp5S9Jg', skater_id: skaters[1].id, spot_id: spots[0].id, category: categories[0], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://www.youtube.com/watch?v=j3EwXPTSlZ8', skater_id: skaters[1].id, spot_id: spots[5].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://www.youtube.com/watch?v=mqGEOK-pnXQ', skater_id: skaters[1].id, spot_id: spots[5].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://www.youtube.com/watch?v=GO-MRMgQS8s', skater_id: skaters[1].id, spot_id: spots[3].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://www.youtube.com/watch?v=MSR71TaFges', skater_id: skaters[1].id, spot_id: spots[8].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://www.youtube.com/watch?v=Marv3fkn3LM', skater_id: skaters[4].id, spot_id: spots[5].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),

]

puts "Success"
