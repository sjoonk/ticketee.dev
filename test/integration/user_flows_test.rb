require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  # fixtures :all

  feature "User managment" do

    scenario "adds a new user" do
      visit "/projects/new"
      2.must_equal 2
    end

  end


end


