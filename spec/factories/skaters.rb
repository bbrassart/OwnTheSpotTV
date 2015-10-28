require "faker"

FactoryGirl.define do
  factory :skater do |f|
    f.username { Faker::Name.first_name }
    f.email { Faker::Internet.email }
    f.password  { "usher" }
    f.password_confirmation { "usher" }
    f.stance {" goofy" }
  end
end
