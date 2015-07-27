require 'rails_helper'

RSpec.describe Skater, type: :model do
  it "will NOT create the skater if email field is empty" do
    skater_example = Skater.new(username: 'Rick', email: '', password: '123', password_confirmation: '123')
    expect(skater_example).not_to be_valid
  end

  it "will NOT create the skater if username is not provided" do
    skater_example = Skater.new(username: '', email: 'example@gmail.com', password: '123', password_confirmation: '123')
    expect(skater_example).not_to be_valid
  end

  it "will NOT create a skater if username is already taken" do
    Skater.create!(username: 'Rick', email: 'another@gmail.com', password: '246', password_confirmation: '246')
    skater_example = Skater.new(username: 'Rick', email: 'example@gmail.com', password: '123', password_confirmation: '123')
    expect(skater_example).not_to be_valid
  end

  it "will NOT create a skater if an account using the email already" do
    Skater.create!(username: 'Rick', email: 'example@gmail.com', password: '246', password_confirmation: '246')
    skater_example = Skater.new(username: 'James', email: 'example@gmail.com', password: '123', password_confirmation: '123')
    expect(skater_example).not_to be_valid
  end

  it "will create a skater properly" do
    skater_example = Skater.create(username: 'Rik', email: 'example@gmail.com', password: '123', password_confirmation: '123')
    expect(skater_example.id).to be_truthy
  end
end
