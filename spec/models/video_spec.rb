require 'rails_helper'

RSpec.describe Video, type: :model do

  before(:each) do
    @skater = Skater.create!(username: 'Usher', email: 'usher@gmail.com', password: 'usher', password_confirmation: 'usher', stance: 'goofy')
    @spot = Spot.create!(name: 'Parc de la Ciutadella', description: 'Awesome manny pad, chillout atmosphere, sunday spot', district: 'Fort Pienc')
  end

  it "will NOT create the video if user ID is not present" do
    video_example = Video.new(url: 'https://www.youtube.com/watch?v=aT_yFSUbbVw', spot_id: @spot.id, category: 'Best line', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(video_example).not_to be_valid
  end

  it "will NOT create the video if URL is not provided" do
    video_example = Video.new(skater_id: @skater.id, spot_id: @spot.id, category: 'Best line', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(video_example).not_to be_valid
  end

  it "will NOT create a video if URL is already online in the site" do
    Video.create!(url: "http://example.com/", skater_id: @skater.id, spot_id: @spot.id, category: 'Best trick', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    video_example = Video.new(url: "http://example.com/", skater_id: @skater.id, spot_id: @spot.id, category: 'Best line', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    expect(video_example).not_to be_valid
  end

#  it "will NOT create a video if an account using the email already" do
#    Video.create!(username: 'Rick', email: 'example@gmail.com', password: '246', password_confirmation: '246')
#    video_example = Video.new(username: 'James', email: 'example@gmail.com', password: '123', password_confirmation: '123')
#    expect(video_example).not_to be_valid
#  end

#  it "will create a video properly" do
#    video_example = Video.create(username: 'Rik', email: 'example@gmail.com', password: '123', password_confirmation: '123')
#    expect(video_example.id).to be_truthy
#  end
end
