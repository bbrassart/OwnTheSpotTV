require "faker"

FactoryGirl.define do
  factory :spot do |f|
    f.name { Faker::Address.street_name }
    f.description { Faker::Lorem.paragraph }
    f.district { Faker::Address.street_name }
    f.visible  { true }
  end
end
