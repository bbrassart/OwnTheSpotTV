require 'rails_helper'

RSpec.describe Spot, type: :model do
  it "will NOT create the spot if description field is empty" do
    spot_example = Spot.new(name: 'foo', description: '', visible: true)
    expect(spot_example).not_to be_valid
  end

  it "will NOT create the spot if name is not provided" do
    spot_example = Spot.new(name: '',  description: 'foo', visible: true)
    expect(spot_example).not_to be_valid
  end

  it "will NOT create a spot if name is already taken" do
    Spot.create!(name: 'foo',  description: 'bar', visible: true)
    spot_example = Spot.new(name: 'foo', description: 'lorem', visible: true)
    expect(spot_example).not_to be_valid
  end

  it "will NOT create a spot if presence is set to nil" do
    spot_example = Spot.new(name: 'foo',  description: 'bar', visible: nil)
    expect(spot_example).not_to be_valid
  end

  it "will create a spot if visible is not provided, default is true" do
    spot_example = Spot.create!(name: 'foo',  description: 'bar')
    expect(spot_example.id).to be_truthy
  end

  it "will create a spot properly" do
    spot_example = Spot.create!(name: 'foo',  description: 'bar', visible: true)
    expect(spot_example.id).to be_truthy
  end
end
