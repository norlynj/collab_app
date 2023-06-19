class TasksController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = Task.all
    @labels = Label.all
    @users = User.where.not(role: "group_leader")
  end

  def show
    @task = Task.find(params[:id])
  end
  # Creates a new task
  def create
    @task = Task.new(title: task_params[:title], description: task_params[:description], label_id: task_params[:label_id], user_id: task_params[:user_id])
    if @task.save
      # Create deadline and Handle successful task creation
      Deadline.create(date: Date.parse(task_params[:deadline]), task_id: @task.id)
      redirect_to @task, notice: 'Task was successfully created.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to create task.'
      render 'new'
    end
  end

  # Updates an existing task
  def edit
    @task = Task.find(params[:id])
    if @task.update(status: params[:status])
      # Handle successful task update
      p "===========updated============"
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to update task.'
    end
  end

  private

  # Permits the title and description parameters for task creation and update
  def task_params
    params.permit(:title, :description, :label_id, :user_id, :deadline, :authenticity_token, :commit, :id, :status)
  end
end
