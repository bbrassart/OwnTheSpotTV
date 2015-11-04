require 'rails_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe Spot, type: :model do
  describe "creation of an instance of skater" do

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
end
