class TasksController < ApplicationController
  # before_action :authenticate_user!
  def index
  end

  # Creates a new task
  def create
    @task = Task.new(task_params)
    if @task.save
      # Handle successful task creation
      redirect_to @task, notice: 'Task was successfully created.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to create task.'
      render 'new'
    end
  end

  # Updates an existing task
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      # Handle successful task update
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to update task.'
      render 'edit'
    end
  end

  private

  # Permits the title and description parameters for task creation and update
  def task_params
    params.require(:task).permit(:title, :description)
  end
end
