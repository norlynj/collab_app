class LabelsController < ApplicationController
  before_action :authenticate_user

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

  # Other controller actions

  private

  def label_params
    params.require(:label).permit(:name)
  end
end
