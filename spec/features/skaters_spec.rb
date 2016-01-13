require 'spec_helper'

RSpec.feature "Homepage", :type => :feature do
  describe "User visits homepage" do
    it "displays the homepage correctly" do
      visit "/"
      expect(page).to have_text("Barcelona Skateboarding")
    end
  end
end

RSpec.feature "Leaderboard", :type => :feature do
  describe "User visits leaderboard" do
    it "displays the leaderboard correctly" do
      visit "/"
      find("#nav-mobile").click_link "Leaderboard"
      expect(page).to have_text("Top 5 ranking")
    end
  end
end

RSpec.feature "Login", :type => :feature do
  describe "User logs in" do
    context 'matching case' do
      it "validates login" do
        skater = Skater.create(username: "Pete",
          email: "pete@example.com",
          password: "veryStrongPass123",
          password_confirmation: "veryStrongPass123",
          stance: "goofy")
        skater.valid?
        visit "/"
        find("#nav-mobile").click_link "Log in"
        fill_in 'Username', :with => 'Pete'
        fill_in 'Password', :with => "veryStrongPass123"
        find('#loginForm').click_button "Log in"
        expect(page.current_path).to eq '/spots'
      end
    end

    context 'not matching cases' do
      before do
        skater = Skater.create(username: "Pete",
          email: "pete@example.com",
          password: "veryStrongPass123",
          password_confirmation: "veryStrongPass123",
          stance: "goofy")
        skater.valid?
      end

      it "won't validate login because of an error in password" do
        visit "/"
        find("#nav-mobile").click_link "Log in"
        fill_in 'Username', :with => 'Peter'
        fill_in 'Password', :with => "veryStrongPass123"
        find('#loginForm').click_button "Log in"
        expect(page.current_path).to eq '/'
      end

      it "won't validate login because username remained empty" do
        visit "/"
        find("#nav-mobile").click_link "Log in"
        fill_in 'Username', :with => ''
        fill_in 'Password', :with => "veryStrongPass123"
        find('#loginForm').click_button "Log in"
        expect(page.current_path).to eq '/'
      end
    end
  end
end
