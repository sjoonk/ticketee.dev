require 'test_helper'

# class ProjectsControllerTest < ActionController::TestCase
# end

describe ProjectsController do

  it "display an error for a mission project" do
    get :show, :id => "not-here"
    assert_redirected_to projects_path
    message = "The project you were looking for could not be found."
    flash[:alert].must_equal message
  end
  
end
