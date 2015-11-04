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

  describe "#most_active_skaters , sort the users by number of videos they submitted" do
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

      it "will return the first skater of the array, the one who submitted the most videos" do
        skaters_array = []
        10.times do |index|
          skaters_array.push(FactoryGirl.create(:skater, username: "#{index + 1}"))
        end
        skaters_array.each do |skater|
          (skater.username.to_i).times do |index|
            FactoryGirl.create(:video, url: "https://www.youtube.com/watch?v=ok1V4C4#{skater.username}#{index.to_s}", skater_id: skater.id )
          end
        end
        expect(Skater.most_active_skaters[0]).to eq(Skater.find_by_username("10"))
      end
    end
  end

  describe "#find_best(videos), give to this method an array of videos sorted by result and it returns the ID of the best skater" do
    context "10 users created and they all have lots of videos" do
      it "will return the ID of the skater whose video has the most votes, so video number 1" do
        skaters_array = []
        10.times do |index|
          skaters_array.push(FactoryGirl.create(:skater, username: "#{index + 1}"))
        end
        videos_array = []
        skaters_array.each do |skater|
          (skater.username.to_i).times do |index|
            videos_array.push(FactoryGirl.create(:video, url: "https://www.youtube.com/watch?v=ok1V4C4#{skater.username}#{index.to_s}", skater_id: skater.id ) )
          end
        end
        20.times do
          vote = FactoryGirl.build(:vote, voter_id: skaters_array.sample.id, video_id: videos_array[0].id)
          if vote.voter_id != Skater.find(videos_array[0].skater.id)
            vote.save
          end
        end
        videos_array.each do |video|
          2.times do
            vote = FactoryGirl.build(:vote, result: -1, voter_id: skaters_array.sample.id, video_id: video.id)
            if vote.voter_id != Video.find(video.id).skater.id
              vote.save
            end
          end
        end
        sorted_clips = videos_array.sort_by {|video| video.votes.sum('result')}.reverse

        expect( Skater.find_best(sorted_clips) ).to eq(Skater.find_by_username("1"))
      end
    end
  end

end
