require 'rails_helper'

RSpec.describe Video, type: :model do
  describe "creation of an instance of a video" do

    context "matching examples" do
      it "will create a video properly" do
        video = FactoryGirl.create(:video)
        expect(video.id).to be_truthy
      end
    end

    context "failing examples" do
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
    end
  end

  describe "#score, it sums the votes on one video" do
    context "one video created with 6 likes and 1 dislike" do
      it "returns the number of votes from a specific video" do
        create_video_with_votes
        expect(Video.first.score).to eq(5)
      end
    end
  end

  describe "#category_trick(category), only the videos from one category" do
    context "10 videos created with randomized category" do
      it "returns only videos whose category is slam" do
        create_spots_with_videos
        randomized_category
        result = Video.category_trick("slam")

        expect( result[rand(3)].category ).to eq("slam")
      end
    end
  end

  describe "#top_videos(n), sort the videos by score and return videos between 0 and n" do
    context "Lots of videos and votes randomly created" do
      it "returns an array of the videos who were the most upvoted, its length 3" do
        create_skaters_videos_and_votes
        expect( Video.top_videos(2).length ).to eq(3)
      end

      it "returns an array, whose first element will be the video which received the highest number of likes" do
        create_skaters_videos_and_votes
        result = Video.top_videos(2)
        expect( result[0].score ).to be > (result[1].score)
      end
    end
  end

  describe "#top_5_videos_with_skater, sort the videos by score and return videos and the skater of the clip" do
    context "Lots of videos and votes randomly created" do
      it "returns an array whose length is 5" do
        create_skaters_videos_and_votes
        result = Video.top_5_videos_with_skater
        expect(result.length).to eq(6)
      end

      it "returns an array, first element should be an array of a length of 2" do
        create_skaters_videos_and_votes
        result = Video.top_5_videos_with_skater
        expect( result[0].length ).to eq(2)
      end

      it "returns an array, first video's score inside first array should be higher than video's score from second array" do
        create_skaters_videos_and_votes
        result = Video.top_5_videos_with_skater
        expect( result[0][1].score).to be >= (result[0][1].score)
      end
    end
  end
end
