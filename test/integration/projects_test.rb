# encoding: UTF-8

require 'test_helper'

class ProjectsTest < ActionDispatch::IntegrationTest
  # fixtures :all

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


  feature "Updating projects" do

    # In order to update project information
    # As as user
    # I want to be able to do that through an interface
    
    it "update a project" do
      @project = FactoryGirl.create(:project, :name => "TextMate2")
      visit root_path
      click_on "TextMate2"
      click_on "Edit Project"
      fill_in "Name", :with => "TextMate2 beta"
      click_on "Update Project"
      page.must_have_content "Project has been updated."
      current_path.must_equal project_path(@project)
    end
    
    scenario "Updating with invalid attributes"

  end

end
