class ProjectsController < ApplicationController
  def show
    @project = Project.get(params[:id])
  end

  def create
    project = Project.new(params[:project])
    
    if project.save
      redirect_to project_path(project)
    else
      redirect_to dashboard_path
    end
  end
end
