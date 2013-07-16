require 'test_helper'

# class ProjectsControllerTest < ActionController::TestCase
# end

describe ProjectsController do

  let (:user) { FactoryGirl.create(:user) }
  let (:project) { FactoryGirl.create(:project) }

  context "standard users" do

    {
      new: "get",
      create: "post",
      edit: "get",
      update: "put",
      destroy: "delete"
    }.each do |action, method|
      it "cannot access the #{action} action" do
        sign_in(:user, user)
        send(method, action.to_s.dup, :id => project.id)
        assert_redirected_to root_path
        flash[:alert].must_equal "You must be an admin to do that."
      end
    end

  end

  it "display an error for a mission project" do
    get :show, :id => "not-here"
    assert_redirected_to projects_path
    message = "The project you were looking for could not be found."
    flash[:alert].must_equal message
  end
  
end
