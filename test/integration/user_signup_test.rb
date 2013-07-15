require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  include EmailSpec::Helpers
  include EmailSpec::Matchers
  # include Capybara::Email::DSL
  include Rails.application.routes.url_helpers

  # fixtures :users

  feature "Sign up" do

    # In order to be attributed for my work
    # As a user
    # I want to be able to sign up

    before do
      # ensure user is signed out
      page.driver.submit :delete, destroy_user_session_path, {}
      User.destroy_all
    end

    scenario "Sigining up" do
      visit root_path
      click_on "Sign up"
      fill_in "Email", :with => "user@ticketee.com"
      fill_in "Password", :with => "password"
      fill_in "Password confirmation", :with => "password" 
      click_button "Sign up"
      # page.must_have_content "You have signed up successfully."
    end
  end

  feature "Sign in" do

    # In order to use the site
    # As a user
    # I want to be able to sign in

    scenario "Signing in via confirmation" do
      user = User.create(:email => "user@ticketee.com", :password => "password")
      # visit_in_email("Confirmation instructions")
      open_last_email
      visit links_in_email(current_email).first
      page.must_have_content "Signed in as user@ticketee.com"
    end

  end


end
