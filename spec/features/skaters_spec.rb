require 'spec_helper'


feature "User visits homepage" do
  scenario "displays the homepage correctly" do

    visit "/"
    expect(page).to have_text("Barcelona Skateboarding")
  end
end

feature "User visits the page containing the rules" do
  scenario "displays the page containing the rules correctly" do

    visit "/"
    find("#nav-mobile").click_link "Know the Mob"
    find("#dropdown1").click_link "8 rules to rule them all"
    expect(page).to have_text("Registered users can submit their own Instagram clips")
  end
end

feature "Signing in" do

  context 'matching case' do

    scenario "validates login", :js => true do
      Video.last.update_attribute(:html, '<blockquote class=\"instagram-media\" data-instgrm-version=\"6\" style=\" background:#FFF; border:0; border-radius:3px; box-shadow:0 0 1px 0 rgba(0,0,0,0.5),0 1px 10px 0 rgba(0,0,0,0.15); margin: 1px; max-width:658px; padding:0; width:99.375%; width:-webkit-calc(100% - 2px); width:calc(100% - 2px);\"><div style=\"padding:8px;\"> <div style=\" background:#F8F8F8; line-height:0; margin-top:40px; padding:50.0% 0; text-align:center; width:100%;\"> <div style=\" background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACwAAAAsCAMAAAApWqozAAAAGFBMVEUiIiI9PT0eHh4gIB4hIBkcHBwcHBwcHBydr+JQAAAACHRSTlMABA4YHyQsM5jtaMwAAADfSURBVDjL7ZVBEgMhCAQBAf//42xcNbpAqakcM0ftUmFAAIBE81IqBJdS3lS6zs3bIpB9WED3YYXFPmHRfT8sgyrCP1x8uEUxLMzNWElFOYCV6mHWWwMzdPEKHlhLw7NWJqkHc4uIZphavDzA2JPzUDsBZziNae2S6owH8xPmX8G7zzgKEOPUoYHvGz1TBCxMkd3kwNVbU0gKHkx+iZILf77IofhrY1nYFnB/lQPb79drWOyJVa/DAvg9B/rLB4cC+Nqgdz/TvBbBnr6GBReqn/nRmDgaQEej7WhonozjF+Y2I/fZou/qAAAAAElFTkSuQmCC); display:block; height:44px; margin:0 auto -44px; position:relative; top:-22px; width:44px;\"></div></div><p style=\" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; line-height:17px; margin-bottom:0; margin-top:8px; overflow:hidden; padding:8px 0 7px; text-align:center; text-overflow:ellipsis; white-space:nowrap;\"><a href=\"https://www.instagram.com/p/9uDwxYizWh/\" style=\" color:#c9c8cd; font-family:Arial,sans-serif; font-size:14px; font-style:normal; font-weight:normal; line-height:17px; text-decoration:none;\" target=\"_blank\">Une vidéo publiée par @seedthespot</a> le <time style=\" font-family:Arial,sans-serif; font-size:14px; line-height:17px;\" datetime=\"2015-11-05T22:20:00+00:00\">5 Nov. 2015 à 14h20 PST</time></p></div></blockquote>\n<script async defer src=platform.instagram.com/en_US/embeds.js></script>')
      skater = Skater.create(username: "Pete",
        email: "pete@example.com",
        password: "v$eryStrongPass123",
        password_confirmation: "v$eryStrongPass123",
        stance: "goofy")
      visit "/"
      find("#nav-mobile").click_link "Log in"
      within("form") do
        fill_in 'Username', :with => skater.username
        fill_in 'Password', :with => skater.password
        click_button "Log in"
      end
      expect(page.current_path).to eq '/spots'
    end
  end


  context 'not matching cases' do
    given(:other_skater) { Skater.create(username: "Pete",
      email: "pete@example.com",
      password: "veryStrongPass123",
      password_confirmation: "veryStrongPass123",
      stance: "goofy") }

    scenario "won't validate login because username remained empty" do
      visit "/"
      find("#nav-mobile").click_link "Log in"
      within("form") do
        fill_in 'Username', :with => ''
        fill_in 'Password', :with => other_skater.password
        click_button "Log in"
      end
      expect(page.current_path).to eq '/login'
    end

    scenario "won't validate login because password remained empty" do
      visit "/"
      find("#nav-mobile").click_link "Log in"
      within("form") do
        fill_in 'Username', :with => other_skater.username
        fill_in 'Password', :with => ''
        click_button "Log in"
      end
      expect(page).to have_content 'Not registered yet'
    end
  end
end
