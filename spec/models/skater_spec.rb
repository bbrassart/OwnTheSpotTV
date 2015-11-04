require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe Skater, type: :model do

  describe "creation of an instance of skater" do

    context "matching examples" do
      it "will create a skater properly" do
        skater = FactoryGirl.create(:skater)
        expect(skater.id).to be_truthy
      end
    end

    context "failing examples" do
      it "will NOT create the skater if email field is empty" do
        skater = FactoryGirl.build(:skater, email: '')
        expect(skater).not_to be_valid
      end

      it "will NOT create the skater if username is not provided" do
        skater = FactoryGirl.build(:skater, username: '')
        expect(skater).not_to be_valid
      end

      it "will NOT create a skater if username is already taken" do
        FactoryGirl.create(:skater, username: 'Rick')
        skater = FactoryGirl.build(:skater, username: 'Rick')
        expect(skater).not_to be_valid
      end

      it "will NOT create a skater if an account using the email already" do
        FactoryGirl.create(:skater, email: 'example@gmail.com')
        skater = FactoryGirl.build(:skater, email: 'example@gmail.com')
        expect(skater).not_to be_valid
      end
    end
  end

  describe "#most_active_skaters , sort the users by number of videos they submitted" do
    context "10 users created and they all have lots of videos" do

      it "will return the length of the most active skaters array, which is 3" do
        create_skaters_and_videos
        expect(Skater.most_active_skaters.length).to eq(3)
      end


      it "will return the first skater of the array, the one who submitted the most videos" do
        create_skaters_and_videos
        expect(Skater.most_active_skaters[0]).to eq(Skater.find_by_username("10"))
      end

    end
  end

  describe "#find_best(videos), give to this method an array of videos sorted by result and it returns the ID of the best skater" do
    context "10 users created and they all have lots of videos" do

      it "will return the ID of the skater whose video has the most votes, so video number 1" do
        create_skaters_videos_and_votes
        sorted_clips = Video.all.sort_by {|video| video.votes.sum('result')}.reverse
        expect( Skater.find_best(sorted_clips) ).to eq(Skater.find_by_username("1"))
      end
    end
  end

  describe "#top_5_number_of_likes, return an array of arrays, each array contains the number of likes from a user and the respective Skater object from top 5 skaters" do
    context "10 users created and they all have lots of videos" do

      it "will return the skater who has the highest numbers of likes as the first element of the first array" do
        create_skaters_videos_and_votes
        expect( Skater.top_5_number_of_likes[0][0]).to eq( Skater.find_by_username("1") )
      end
    end
  end

end
