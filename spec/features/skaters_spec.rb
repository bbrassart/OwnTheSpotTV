require 'spec_helper'

RSpec.feature "Homepage", :type => :feature do
  describe "User visits homepage" do
    it "sees the homepage correctly" do
      visit "/"
      expect(page).to have_text("Barcelona Skateboarding")
    end

  end

  describe "User visits leaderboard" do
    it "sees the leaderboard correctly" do
      visit "/rankings"
      expect(page).to have_text("Top 5 ranking")
    end
  end

  describe "User logs in" do
    context 'matching case' do
      it "validates login" do
        skater = Skater.create(username: "Pete",
          email: "pete@example.com",
          password: "veryStrongPass123",
          password_confirmation: "veryStrongPass123",
          stance: "goofy")
        skater.valid?
        visit "/login"
        fill_in 'Username', :with => 'Pete'
        fill_in 'Password', :with => "veryStrongPass123"
        find('#loginForm').click_button "Log in"
        expect(page.current_path).to eq '/spots'
      end
    end

    context 'not matching cases' do
      it "won't validate login" do
        skater = Skater.create(username: "Pete",
          email: "pete@example.com",
          password: "veryStrongPass123",
          password_confirmation: "veryStrongPass123",
          stance: "goofy")
        skater.valid?
        visit "/login"
        fill_in 'Username', :with => 'Peter'
        fill_in 'Password', :with => "veryStrongPass123"
        find('#loginForm').click_button "Log in"
        expect(page.current_path).to eq '/'
      end
    end
  end
end
