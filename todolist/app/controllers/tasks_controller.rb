class TasksController < ApplicationController
  def index
     new
     @tasks = Task.all
  end

  def new
	@task = Task.new
  end

  def create
	@task = Task.new(params[:task])
	if @task.save
		flash[:notice] = 'Task successfully created'
		redirect_to :action => "index"
	else
		flash[:notice] = 'Failed to Create the Task'
		@tasks = Task.all
		render :action => "index"
	end
  end

  def completed
	@task = Task.find(params[:id])
	new = {:finished => true, :priority => 10000}
	@task.update_attributes{new}
	redirect_to :action => "index"
  end

  def undo_completed
	@task = Task.find(params[:id])
	new = {:finished => false, :priority => 0}
	@task.update_atrributes{new}
	redirect_to :action => "index"
  end

  def destroy 
	@task = Task.find(params[:id])
	@task.destroy
	redirect_to(tasks_url)
  end
end
