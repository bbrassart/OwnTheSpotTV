require "faker"

FactoryGirl.define do
  factory :skater do |f|
    strong_password = Faker::Internet.password(10, 20)
    f.username { Faker::Name.first_name }
    f.email { Faker::Internet.email }
    f.password  { strong_password }
    f.password_confirmation { strong_password }
    f.stance {"goofy" }
  end
end
