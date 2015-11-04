require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe Spot, type: :model do
  describe "creation of an instance of a spot" do

    context "matching examples" do
      it "will create a spot properly" do
        spot = FactoryGirl.create(:spot)
        expect(spot.id).to be_truthy
      end
    end

    context "failing examples" do
      it "will NOT create the spot if description field is empty" do
        spot = FactoryGirl.build(:spot, description: '')
        expect(spot).not_to be_valid
      end

      it "will NOT create the spot if name is not provided" do
        spot = FactoryGirl.build(:spot, name: '')
        expect(spot).not_to be_valid
      end

      it "will NOT create a spot if name is already taken" do
        FactoryGirl.create(:spot, name: 'foo')
        spot = FactoryGirl.build(:spot, name: 'foo')
        expect(spot).not_to be_valid
      end

      it "will NOT create a spot if presence is set to nil" do
        spot = FactoryGirl.build(:spot, visible: nil)
        expect(spot).not_to be_valid
      end
    end
  end

  describe "#most_active_spots, sort the spots and return array of 3 most active spots" do
    context "10 skaters with videos" do
      it "return an array of 3 elements, the spots with more videos" do
        create_spots_with_videos
        expect(Spot.most_active_spots.count).to eq(3)
      end

      it "will return an array, whose first element is the spot with most videos submitted" do
        create_spots_with_videos
        expect(Spot.most_active_spots[0].name).to eq("9")
      end
    end
  end
end
