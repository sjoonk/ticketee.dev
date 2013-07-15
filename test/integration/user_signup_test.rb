require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  j fixtures :users

  feature "Sign up" do

    # In order to be attributed for my work
    # As a user
    # I want to be able to sign up

    scenario "Sigining up" do
      visit root_path
      click_on "Sign up"
      fill_in "Email", :with => "user@ticketee.com"
      fill_in "Password", :with => "password"
      fill_in "Password confirmation", :with => "password" 
      click_button "Sign up"
      page.must_have_content "You have signed up successfully."
    end

  end
end
