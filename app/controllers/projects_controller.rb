class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.get(params[:id])
  end

  def create
    project = Project.new(params[:project])
    
    if project.save
      redirect_to project_path(project)
    else
      redirect_to dashboards_path
    end
  end

  def destroy
    project = Project.get(params[:id])
    project.destroy

    redirect_to dashboards_path
  end
end
