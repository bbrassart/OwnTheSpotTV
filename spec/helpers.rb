module Helpers
  def create_skaters
    Skater.destroy_all
    skaters_array = []
    10.times do |index|
      skaters_array.push(FactoryGirl.create(:skater, username: "#{index + 1}"))
    end
    skaters_array
  end

  def create_skaters_and_videos
    skaters_array = create_skaters
    Video.destroy_all
    skaters_array.each do |skater|
      (skater.username.to_i).times do |index|
        FactoryGirl.create(:video, url: "https://www.youtube.com/watch?v=ok1V4C4#{skater.username}#{index.to_s}", skater_id: skater.id )
      end
    end
    skaters_array
  end

  def create_skaters_videos_and_votes
    create_skaters_and_videos
    Vote.destroy_all
    20.times do
      vote = FactoryGirl.build(:vote, voter_id: Skater.all.sample.id, video_id: Video.first.id)
      if vote.voter_id != Video.first.skater_id
        vote.save
      end
    end
    Video.all.each do |video|
      2.times do
        vote = FactoryGirl.build(:vote, result: -1, voter_id: Skater.all.sample.id, video_id: video.id)
        if vote.voter_id != video.skater_id
          vote.save
        end
      end
    end
  end
end
