require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe "creation of an instance of a vote" do

    context "matching examples" do
      it "will create the vote correctly" do
        vote = FactoryGirl.create(:vote)
        expect(vote).to be_valid
      end

      it "will create correctly the votes if the user vote for one video and then a different one" do
        FactoryGirl.create(:vote)
        vote = FactoryGirl.create(:vote, video_id: 3)
        expect(vote).to be_valid
      end
    end

    context "failing examples" do
      it "will NOT create the vote if voter ID is not present" do
        vote = FactoryGirl.build(:vote, voter_id: "")
        expect(vote).not_to be_valid
      end

      it "will NOT create the vote if video ID is not present" do
        vote = FactoryGirl.build(:vote, video_id: "")
        expect(vote).not_to be_valid
      end

      it "will NOT create the vote if result is higher than 1" do
        vote = FactoryGirl.build(:vote, result: 2)
        expect(vote).not_to be_valid
      end

      it "will NOT create the vote if result is lower than -1" do
        vote = FactoryGirl.build(:vote, result: -2)
        expect(vote).not_to be_valid
      end

      it "will NOT create the vote if user has already voted for the video" do
        FactoryGirl.create(:vote)
        vote = FactoryGirl.build(:vote)
        expect(vote).not_to be_valid
      end
    end
  end
end
