class TasksController < ApplicationController
  before_filter :ensure_login
  before_filter :get_person

  def index
     new
     @tasks = @person.tasks
  end

  def new
	@task = Task.new
  end

  def create
	@task = @person.tasks.build(params[:task])
	if @task.save
		flash[:notice] = 'Task successfully created'
		redirect_to :action => "index"
	else
		flash[:notice] = 'Failed to Create the Task'
		@tasks = @person.tasks
		render :action => "index"
	end
  end

  def completed
	@task = @person.tasks.find(params[:id])
	new = {:finished => true, :priority => 10000}
	@task.update_attributes(new)
	redirect_to :action => "index"
  end

  def undo_completed
	@task = @person.tasks.find(params[:id])
	new = {:finished => false, :priority => 0}
	@task.update_attributes(new)
	redirect_to :action => "index"
  end

  def destroy 
	@task = @person.tasks.find(params[:id])
	@task.destroy
	redirect_to(tasks_url)
  end

  private

  def get_person
    @person = Person.find(@user)
  end

end
