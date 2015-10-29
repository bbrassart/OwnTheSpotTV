require "faker"

FactoryGirl.define do
  factory :vote do |f|
    f.voter_id { 1 }
    f.video_id { 2 }
    f.result { 1 }
  end
end
