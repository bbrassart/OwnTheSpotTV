require 'rails_helper'

RSpec.describe Video, type: :model do

  it "will NOT create the video if skater ID is not present" do
    video = FactoryGirl.build(:video, skater_id: "")
    expect(video).not_to be_valid
  end

  it "will NOT create the video if URL is not provided" do
    video = FactoryGirl.build(:video, url: "")
    expect(video).not_to be_valid
  end

  it "will NOT create the video if category is not line, slam or trick" do
    video = FactoryGirl.build(:video, category: "twotricks")
    expect(video).not_to be_valid
  end

  it "will NOT create the video if URL does not include Youtu" do
    video = FactoryGirl.build(:video, url: 'https://www.yotbe.com/watch?v=aT_yFSUbbVw')
    expect(video).not_to be_valid
  end

  it "will NOT create the video if URL is larger than 43 characters" do
    video = FactoryGirl.build(:video, url: 'https://www.youtbe.com/watch?v=aT_yFSUbbVwsdbsdudesc/ibfjhfkdbadadsbkadjs/')
    expect(video).not_to be_valid
  end

  it "will NOT create the video if URL is smaller than 26 characters" do
    video = FactoryGirl.build(:video, url: 'https://www.youtu.be/sml')
    expect(video).not_to be_valid
  end


  it "will NOT create a video if URL is already online in the site" do
    FactoryGirl.create(:video, url: "https://www.youtube.com/watch?v=0emMYsy0Wak")
    video = FactoryGirl.build(:video, url: "https://www.youtube.com/watch?v=0emMYsy0Wak")
    expect(video).not_to be_valid
  end

  it "will create a video properly" do
    video = FactoryGirl.create(:video)
    expect(video.id).to be_truthy
  end
end
