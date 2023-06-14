class LabelsController < ApplicationController
  before_action :authenticate_user

  # Creates a new label for a task
  def create
    @task = Task.find(params[:task_id])
    @label = @task.labels.build(label_params)
    if @label.save
      # Handle successful label creation
      redirect_to @task, notice: 'Label was successfully added.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to add label.'
      render 'tasks/show'
    end
  end

  # Updates an existing label
  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      # Handle successful label update
      redirect_to @label.task, notice: 'Label was successfully updated.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to update label.'
      render 'edit'
    end
  end

  private

  # Permits the name parameter for label creation and update
  def label_params
    params.require(:label).permit(:name)
  end
end
