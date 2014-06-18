require 'spec_helper'

feature "New Entry" do
  background do
    Fabricate(:user, email: "ruby@example.com")
    visit new_user_session_path
    fill_in "Email", with: "ruby@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
  end

  scenario "user creates a new entry" do
    click_link "New Entry"
    fill_in "Trail Date", with: "03/03/2014"
    fill_in "Trail Name", with: "Who knows"
    fill_in "Length", with: "12 miles"
    fill_in "State", with: "TN"
    fill_in "City", with: "Knoxville"
    fill_in "Notes", with: "It was hot."
    click_button "Log Trail"
    page.should have_content "All Trail Entries"
  end
end
