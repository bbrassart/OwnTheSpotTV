module Helpers

  def assign_votes_to_one_video
    6.times do |index|
      FactoryGirl.create(:vote, result: 1, voter_id: Skater.find_by_username((index + 2).to_s).id, video_id: Video.first.id)
    end
    FactoryGirl.create(:vote, result: -1, voter_id: Skater.last.id, video_id: Video.first.id)
  end

  def create_video_with_votes
    create_skaters
    create_spots
    Video.destroy_all
    FactoryGirl.create(:video, skater_id: Skater.first.id, spot_id: Spot.first.id)
    Vote.destroy_all
    assign_votes_to_one_video
  end

  def create_spots
    Spot.destroy_all
    10.times do |index|
      FactoryGirl.create(:spot, name: "#{index}")
    end
  end

  def create_spots_with_videos
    create_spots
    create_skaters
    Video.destroy_all
    Skater.all.each do |skater|
      (skater.username.to_i).times do |index|
        FactoryGirl.create(:video, spot_id: index, url: "https://instagram.com/p/91yPIDC#{skater.username}#{index.to_s}/?taken-by=seedthespot", skater_id: skater.id )
      end
    end
  end

  def create_skaters
    Skater.destroy_all
    10.times do |index|
      FactoryGirl.create(:skater, username: "#{index + 1}")
    end
  end

  def randomized_category
    categories = ["slam", "line", "trick"]
    Video.all.each do |video|
      video.category = categories.sample
      video.save
    end
  end

  def create_skaters_and_videos
    create_skaters
    Video.destroy_all
    Skater.all.each do |skater|
      (skater.username.to_i).times do |index|
        FactoryGirl.create(:video, url: "https://instagram.com/p/91yPIDC#{skater.username}#{index.to_s}/?taken-by=seedthespot", skater_id: skater.id )
      end
    end
  end

  def twenty_votes_for_best_video
    20.times do
      vote = FactoryGirl.build(:vote, voter_id: Skater.all.sample.id, video_id: Video.first.id)
      if vote.voter_id != Video.first.skater_id
        vote.save
      end
    end
  end

  def two_votes_for_each_video
    Video.all.each do |video|
      2.times do
        vote = FactoryGirl.build(:vote, result: -1, voter_id: Skater.all.sample.id, video_id: video.id)
        if vote.voter_id != video.skater_id
          vote.save
        end
      end
    end
  end

  def create_skaters_videos_and_votes
    create_skaters_and_videos
    twenty_votes_for_best_video
    two_votes_for_each_video
  end
end
