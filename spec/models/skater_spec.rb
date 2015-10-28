require 'rails_helper'

RSpec.describe Skater, type: :model do
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

  it "will create a skater properly" do
    skater = FactoryGirl.create(:skater)
    expect(skater.id).to be_truthy
  end
end
