require "faker"

FactoryGirl.define do
  factory :video do |f|
    f.url { "https://instagram.com/p/91yPIDCzYm#{(1..3000).to_a.sample}/?taken-by=seedthespot"  }
    f.skater_id { 1 }
    f.spot_id { 2 }
    f.category  { "trick" }
  end
end
