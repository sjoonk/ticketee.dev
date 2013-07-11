# encoding: UTF-8

require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest
  fixtures :all

  feature "Creating projects" do
    
    # In order to have projects to assing tickets to
    # As a user
    # I want to create them easily

    scenario "create a project" do
      visit "/" 
      click_on "New Project"
      fill_in "Name", :with => "TextMate 2" 
      click_on "Create Project"
      page.must_have_content "Project has been created."
    end

    scenario "creating a project without a name" do
      visit "/"
      click_on "New Project"
      click_on "Create Project"
      page.must_have_content "Project has not been created."
      page.must_have_content "Name can't be blank"
    end

  end

end
