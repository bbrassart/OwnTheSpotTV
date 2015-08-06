require 'rails_helper'

RSpec.describe Video, type: :model do

  before(:each) do
    @skater = Skater.create!(username: 'Usher', email: 'usher@gmail.com', password: 'usher', password_confirmation: 'usher', stance: 'goofy')
    @spot = Spot.create!(name: 'Parc de la Ciutadella', description: 'Awesome manny pad, chillout atmosphere, sunday spot', district: 'Fort Pienc')
  end

  it "will NOT create the video if user ID is not present" do
    video_example = Video.new(url: 'https://www.youtube.com/watch?v=aT_yFSUbbVw', spot_id: @spot.id, category: 'line', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(video_example).not_to be_valid
  end

  it "will NOT create the video if URL is not provided" do
    video_example = Video.new(skater_id: @skater.id, spot_id: @spot.id, category: 'line', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(video_example).not_to be_valid
  end

  it "will NOT create the video if category is not line, slam or trick" do
    video_example = Video.new(skater_id: @skater.id, spot_id: @spot.id, category: 'twotricks', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(video_example).not_to be_valid
  end

  it "will NOT create the video if URL does not include Youtu" do
    video_example = Video.new(url: 'https://www.youtbe.com/watch?v=aT_yFSUbbVw', skater_id: @skater.id, spot_id: @spot.id, category: 'line', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(video_example).not_to be_valid
  end

  it "will NOT create the video if URL is larger than 43 characters" do
    video_example = Video.new(url: 'https://www.youtbe.com/watch?v=aT_yFSUbbVwsdbsdudesc/ibfjhfkdbadadsbkadjs/', skater_id: @skater.id, spot_id: @spot.id, category: 'line', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(video_example).not_to be_valid
  end

  it "will NOT create the video if URL is smaller than 27 characters" do
    video_example = Video.new(url: 'https://www.youtu.be/small', skater_id: @skater.id, spot_id: @spot.id, category: 'line', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(video_example).not_to be_valid
  end


  it "will NOT create a video if URL is already online in the site" do
    Video.create!(url: "https://www.youtube.com/watch?v=aT_yFSUbbVw", skater_id: @skater.id, spot_id: @spot.id, category: 'trick', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    video_example = Video.new(url: "https://www.youtube.com/watch?v=aT_yFSUbbVw", skater_id: @skater.id, spot_id: @spot.id, category: 'trick', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(video_example).not_to be_valid
  end

  it "will create a video properly" do
    example = Video.create!(url: "https://www.youtube.com/watch?v=aT_yFSUbbVw", skater_id: @skater.id, spot_id: @spot.id, category: 'trick', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(example.id).to be_truthy
  end
end
