require 'spec_helper'

feature "User sign up" do
  scenario "successful" do
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign Up"
    page.should have_content "Welcome to Blaze!"
    pending
    current_path.should == account_path
  end

  scenario "failed" do
    User.create(email: "user@example.com", password: "password", password_confirmation: "password")
    visit '/'
    click_link "Sign Up"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "notthepassword"
    click_button "Sign Up"
    page.should_not have_content "Welcome to Blaze!"
    page.should have_content "Your account could not be created."
    page.should have_error("already exists", on: "Email")
    page.should have_error("must match confirmation", on: "Password")
  end
end
