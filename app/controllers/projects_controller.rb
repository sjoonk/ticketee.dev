class ProjectsController < ApplicationController
  def index
  end

  def new
    @project = Project.new
  end

  def create
    # logger.debug "LOGGER.DEBUG: #{params.inspect}"
    @project = Project.new(params[:project])
    @project.save
    redirect_to @project, :notice => "Project has been created."
  end

  def show
    @project = Project.find(params[:id])
  end

end
