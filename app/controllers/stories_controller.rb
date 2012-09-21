class StoriesController < ApplicationController
  def create
    project = Project.get(params[:project_id])
    story = project.stories.new(params[:story])
    story.save

    redirect_to projects_path(project)
  end
end
