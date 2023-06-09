class DeadlinesController < ApplicationController
  before_action :authenticate_user

  # Creates a new deadline for a task
  def create
    @task = Task.find(params[:task_id])
    @deadline = @task.build_deadline(deadline_params)
    if @deadline.save
      # Handle successful deadline creation
      redirect_to @task, notice: 'Deadline was successfully set.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to set deadline.'
      render 'tasks/show'
    end
  end

  # Updates an existing deadline
  def update
    @deadline = Deadline.find(params[:id])
    if @deadline.update(deadline_params)
      # Handle successful deadline update
      redirect_to @deadline.task, notice: 'Deadline was successfully updated.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to update deadline.'
      render 'edit'
    end
  end

  private

  # Permits the date parameter for deadline creation and update
  def deadline_params
    params.require(:deadline).permit(:date)
  end
end
