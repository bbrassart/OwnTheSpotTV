require 'rails_helper'

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

  describe "#most_active_skaters method, sort the users by number of videos they submitted" do
    context "10 users created and they all have lots of videos" do
      it "will return the length of the most active skaters array, which is 3" do
        skaters_array = []
        10.times do
          skaters_array.push(FactoryGirl.create(:skater))
        end
        200.times do |index|
          FactoryGirl.create(:video, url: "https://www.youtube.com/watch?v=#{index}ok1VgnC4", skater_id: skaters_array.sample.id)
        end
        expect(Skater.most_active_skaters.length).to eq(3)
      end
    end
  end
end
