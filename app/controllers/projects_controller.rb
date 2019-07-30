class ProjectsController < ApplicationController
	def index
		@projects = Project.all
	end
	#By calling all on the Project model, you retrieve all the records from the database as Project objects, and they’r
	
	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			flash[:notice] = "Project has been created."
			redirect_to @project
		else
			flash.now[:alert] = "Project has not been created."
    		render "new"
		end	
	end

	def show
		@project = Project.find(params[:id])
	end

	private	

	def project_params
		params.require(:project).permit(:name, :description)
	end		
end
