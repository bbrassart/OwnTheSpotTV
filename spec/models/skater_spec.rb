require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe Skater, type: :model do

  describe "creation of an instance of skater" do

    context "matching examples" do
      it "will create a skater properly" do
        skater = FactoryGirl.build(:skater)
        expect(skater).to be_valid
      end
    end

    context "failing examples" do
      it "will NOT create the skater if email field is empty" do
        skater = FactoryGirl.build(:skater, email: nil)
        skater.valid?
        expect(skater.errors[:email]).to include("can't be blank")
      end

      it "will NOT create the skater if username is not provided" do
        skater = FactoryGirl.build(:skater, username: '')
        skater.valid?
        expect(skater.errors[:username]).to include("can't be blank")
      end

      it "will NOT create a skater if username is already taken" do
        FactoryGirl.create(:skater, username: 'Rick')
        skater = FactoryGirl.build(:skater, username: 'Rick')
        skater.valid?
        expect(skater.errors[:username]).to include("has already been taken")
      end

      it "will NOT create a skater if an account using the email already" do
        FactoryGirl.create(:skater, email: 'example@gmail.com')
        skater = FactoryGirl.build(:skater, email: 'example@gmail.com')
        skater.valid?
        expect(skater.errors[:email]).to include("has already been taken")
      end
    end
  end

  describe "#most_active_skaters , sort the users by number of videos they submitted" do
    context "10 users created and they all have lots of videos" do

      it "will return the length of the most active skaters array, which is in this case is 6" do
        create_skaters_and_videos
        top_5__most_active_skaters = Skater.most_active_skaters(9)
        expect(top_5__most_active_skaters.length).to eq(10)
      end


      it "will return the first skater of the array, the one who submitted the most videos" do
        create_skaters_and_videos
        expect(Skater.most_active_skaters(10)[0]).to eq(Skater.find_by_username("10"))
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

end
