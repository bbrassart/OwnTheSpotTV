require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@example.com', 'password'
    expect(page).to have_content('The crime scenes')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Signup')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Signup')
  end

  def sign_up_with(email, password)
    visit new_skater_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Submit'
  end
end
