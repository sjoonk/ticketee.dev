class ProjectsController < ApplicationController
  def index
    @project = Project.all
  end 

  def new
    @project = Project.new
  end

  def create
    # logger.debug "LOGGER.DEBUG: #{params.inspect}"
    @project = Project.new(params[:project])
    if @project.save
      redirect_to @project, :notice => "Project has been created."
    else
      flash[:alert] = "Project has not been created."
      render :action => "new"
    end
  end

  def show
    @project = Project.find(params[:id])
  end

end
