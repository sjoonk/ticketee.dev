require 'test_helper'

class ViewingProjectsTest < ActionDispatch::IntegrationTest
  # fixtures :all
  fixtures :projects

  # In order to assign tickets to a project
  # As a user
  # I want to be able to see a list of available projects
  
  scenario "Listing all projects" do
    # project = FactoryGirl.create(:project, :name => "TextMate 2")
    project = projects(:default)
    visit "/"
    click_on "TextMate 2"
    current_path.must_equal project_path(project) 
  end

end
