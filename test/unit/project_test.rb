require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  it "is invalid without name" do
    @project = Project.new
    @project.save
    @project.wont_be :valid?
  end

end
