require "faker"

FactoryGirl.define do
  factory :video do |f|
    f.url { "https://www.youtube.com/watch?v=aT_yFSUb#{(1..300).to_a.sample}"  }
    f.skater_id { 1 }
    f.spot_id { 2 }
    f.category  { "trick" }
    f.description { Faker::Lorem.sentence(5) }
    f.name { Faker::Lorem.sentence(2) }
  end
end
