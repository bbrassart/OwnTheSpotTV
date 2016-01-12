require 'spec_helper'

RSpec.feature "Homepage", :type => :feature do
  scenario "User sees homepage" do
    visit "/"
    expect(page).to have_text("Barcelona Skateboarding")
  end

  scenario "User creates a new widget" do
    visit "/rankings"
    expect(page).to have_text("Top 5 ranking")
  end

  scenario "User visits login page" do
    skater = Skater.create(username: "Pete",
                           email: "pete@example.com",
                           password: "veryStrongPass123",
                           password_confirmation: "veryStrongPass123",
                           stance: "goofy")
    skater.valid?                
    visit "/login"
    fill_in 'Username', :with => 'Pete'
    fill_in 'Password', :with => "veryStrongPass123"
    click_button "Log in"
    expect(page.current_path).to eq '/spots'
  end


end
