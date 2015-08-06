require 'rails_helper'

RSpec.describe Vote, type: :model do

  before(:each) do
    @skater = Skater.create!(username: 'Usher', email: 'usher@gmail.com', password: 'usher', password_confirmation: 'usher', stance: 'goofy')
    @spot = Spot.create!(name: 'Parc de la Ciutadella', description: 'Awesome manny pad, chillout atmosphere, sunday spot', district: 'Fort Pienc')
    @video = Video.create!(url: "https://www.youtube.com/watch?v=aT_yFSUbbVw", skater_id: @skater.id, spot_id: @spot.id, category: 'trick', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
    @video_two = Video.create!(url: "https://www.youtube.com/watch?v=hefhyerhdhn", skater_id: @skater.id, spot_id: @spot.id, category: 'line', description: Faker::Lorem.sentence(5), name: Faker::Lorem.sentence(2))
  end

  it "will NOT create the vote if voter ID is not present" do
    vote_example = Vote.new(video_id: @video.id, result: 1)
    expect(vote_example).not_to be_valid
  end

  it "will NOT create the vote if video ID is not present" do
    vote_example = Vote.new(voter_id: @skater.id, result: 1)
    expect(vote_example).not_to be_valid
  end

  it "will NOT create the vote if result is higher than 1" do
    vote_example = Vote.new(voter_id: @skater.id, video_id: @video.id, result: 2)
    expect(vote_example).not_to be_valid
  end

  it "will NOT create the vote if result is lower than -1" do
    vote_example = Vote.new(voter_id: @skater.id, video_id: @video.id, result: -2)
    expect(vote_example).not_to be_valid
  end

  it "will NOT create the vote if user has already voted for the video" do
    Vote.create!(voter_id: @skater.id, video_id: @video.id, result: -1)
    vote_example = Vote.new(voter_id: @skater.id, video_id: @video.id, result: 1)
    expect(vote_example).not_to be_valid
  end

  it "will create correctly the votes if the user vote for one video and then a different one" do
    Vote.create!(voter_id: @skater.id, video_id: @video.id, result: -1)
    vote_example = Vote.new(voter_id: @skater.id, video_id: @video_two.id, result: -1)
    expect(vote_example).to be_valid
  end

  it "will create the vote coorectly" do
    vote_example = Vote.new(voter_id: @skater.id, video_id: @video.id, result: -1)
    expect(vote_example).to be_valid
  end





end
