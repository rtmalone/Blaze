require 'spec_helper'

feature "User sign up" do
  scenario "successful" do
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "user@example.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    page.should have_content "Welcome to Blaze!"

    click_link "Sign Out"
    click_link "Sign In"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content "You have signed in successfully"
  end

  scenario "failed" do
    User.create(email: "user@example.com", password: "password", password_confirmation: "password")
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "user@example.com"
    fill_in "user_password", with: "password"
    fill_in "Password confirmation", with: "notthepassword"
    click_button "Sign up"
    page.should_not have_content "Welcome to Blaze!"
    page.should have_content "has already been taken"
    page.should have_content "doesn't match Password"
  end
end
