# This file should contain all the record creation needed to seed the database with its default values.# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Skater.all.destroy_all
Spot.all.destroy_all
Video.all.destroy_all
Vote.all.destroy_all
ActiveRecord::Base.connection.execute(“delete from friendly_id_slugs“)

spots = [
  Spot.create!(name: "Plaça Universitat", description: "Marble ledges everywhere, perfect flatground, best SKATE game spot, lines for days", district: 'Eixample'),
  Spot.create!(name: 'Macba', description: "The one and only Macba, the dream spot, ledges, stairs, gaps, all you need to prove your skills", district: 'Raval'),
  Spot.create!(name: 'Macba downhill', description: "This spot is located between Plaça Universitat and the Macba. A very funny little downhill with banks and little curbs. Getcha slappy on!", district: 'Raval'),
  Spot.create!(name: 'Mercat de las Flors', description: "Probably the best ledge in Barcelona. Perfect to practice your ledge skills", district: 'Poble Sec'),
  Spot.create!(name: 'Arc de Triomf', description: 'Another perfect spot in Barcelona', district: 'Fort Pienc'),
  Spot.create!(name: 'Parc de la Ciutadella', description: 'Awesome manny pad, chillout atmosphere, sunday spot', district: 'Fort Pienc'),
  Spot.create!(name: 'Montbau manual pad', description: 'Little stair up, long manny and a bank to go down, the way to go', district: 'Montbau'),
  Spot.create!(name: 'Montbau downhill', description: 'Try to get the perfect line at this difficult spot', district: 'Montbau'),
  Spot.create!(name: 'Hostafrancs', description: 'Stairs for days, a big handrail and a big flatground space', district: 'Sants'),
  Spot.create!(name: 'Barceloneta banks', description: 'Funny banks to skate', district: 'Barceloneta'),
  Spot.create!(name: "Plaça d'Anna Frank", description: 'A big set of stairs, a man sized handrail', district: 'Gracia'),
  Spot.create!(name: "Forum stairs", description: 'That double set has already been murdered but who knows, maybe you come up with something new', district: 'Forum'),
  Spot.create!(name: "Vallcarca tennis court curbs", description: 'Low curbs, lines for days', district: 'Vallcarca'),
  Spot.create!(name: "Forum fountain", description: 'Weird sculpture with all kind of possibilities. Mannys, banks, curbs and all...', district: 'Forum'),
  Spot.create!(name: "The infamois red low-to-high curb", description: 'A very long metal ledge, low-to-high-to-low', district: 'Poble Nou'),
  Spot.create!(name: "Glories bumps and curbs", description: 'Some awesome kickers, colored curbs everywhere, security is on the alert', district: 'Glories'),
  Spot.create!(name: "Marina micro spot", description: 'Stairs, a mini curb, a long hanbdrail, get creative!', district: 'Marina'),
  Spot.create!(name: "World Trade Center", description: 'Perfect flatground, curbs, benches and security is on the alert', district: 'Drassanes'),
  Spot.create!(name: "Hotel Vela", description: 'Chlly sunday spot, curbs and weird wavy structure', district: 'Barceloneta'),
  Spot.create!(name: "Estació de Sants", description: "Another mytical plaza, try your best to kill this spot before anyone else does", district: 'Sants')


]

skaters = [
  Skater.create!(username: 'Richie', email: 'richard.william.roberts@gmail.com', password: 'richie', password_confirmation: 'richie', stance: 'goofy'),
  Skater.create!(username: 'Baptiste', email: 'baptiste.brassart@gmail.com', password: 'baptiste', password_confirmation: 'baptiste', stance: 'regular'),
  Skater.create!(username: 'Usher', email: 'usher@gmail.com', password: 'usher', password_confirmation: 'usher', stance: 'goofy'),
  Skater.create!(username: 'Damingo', email: 'blackout@hotmail.fr', password: 'damingo', password_confirmation: 'damingo', stance: 'regular'),
  Skater.create!(username: 'Gavin', email: 'gavin@gmail.com', password: 'gavin', password_confirmation: 'gavin', stance: 'regular'),
  Skater.create!(username: 'Enrico', email: 'enricon@gmail.com', password: 'enrico', password_confirmation: 'enrico', stance: 'regular')

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
  Video.create!(url: 'https://www.youtube.com/watch?v=mY8PBrjNdwk', skater_id: skaters[4].id, spot_id: spots[5].id, category: categories[0], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://www.youtube.com/watch?v=WoB1dZAAaNE', skater_id: skaters[4].id, spot_id: spots[5].id, category: categories[2], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://www.youtube.com/watch?v=LNIH4jraLk0', skater_id: skaters[3].id, spot_id: spots[3].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://www.youtube.com/watch?v=w68bAwu9RDs', skater_id: skaters[3].id, spot_id: spots[3].id, category: categories[0], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'http://youtu.be/eqI9yo19dps', skater_id: skaters[5].id, spot_id: spots[5].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'http://youtu.be/_ut8DOv3XeI', skater_id: skaters[5].id, spot_id: spots[5].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'http://youtu.be/GmhSdznosGk', skater_id: skaters[5].id, spot_id: spots[5].id, category: categories[0], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'http://youtu.be/Q9Ndo2VZmYA', skater_id: skaters[5].id, spot_id: spots[5].id, category: categories[0], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'http://youtu.be/1Ph9RzcD3bg', skater_id: skaters[5].id, spot_id: spots[3].id, category: categories[0], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'http://youtu.be/eavp9d8xWmk', skater_id: skaters[5].id, spot_id: spots[3].id, category: categories[0], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'http://youtu.be/NGJh5Neubro', skater_id: skaters[5].id, spot_id: spots[3].id, category: categories[1], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'http://youtu.be/lKVXwLlCL-c', skater_id: skaters[5].id, spot_id: spots[5].id, category: categories[2], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2)),
  Video.create!(url: 'https://youtu.be/On_coapihnQ', skater_id: skaters[5].id, spot_id: spots[5].id, category: categories[0], description: Faker::Lorem.sentence(5), name:  Faker::Lorem.sentence(2))


]

votes = [
  Vote.create!(voter_id: skaters[1].id, video_id: videos[0].id, result: 1),
  Vote.create!(voter_id: skaters[2].id, video_id: videos[0].id, result: 1),
  Vote.create!(voter_id: skaters[4].id, video_id: videos[0].id, result: 1),
  Vote.create!(voter_id: skaters[4].id, video_id: videos[4].id, result: 1),
  Vote.create!(voter_id: skaters[3].id, video_id: videos[7].id, result: 1),

]

puts "Success"
