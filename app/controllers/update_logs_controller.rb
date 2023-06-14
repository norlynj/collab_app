class UpdateLogsController < ApplicationController
  # create an update log for a specific task
  def create
    @task = Task.find(params[:task_id])
    @update_log = @task.update_logs.build(update_log_params)
    if @update_log.save
      # Handle successful update log creation
      redirect_to @task, notice: 'Update log was successfully added.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to add update log.'
      render 'tasks/show'
    end
  end

  def update
    @update_log = UpdateLog.find(params[:id])
    if @update_log.update(update_log_params)
      # Handle successful update log update
      redirect_to @update_log.task, notice: 'Update log was successfully updated.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to update update log.'
      render 'edit'
    end
  end

  private

  # Permits the content parameter for update log creation and update
  def update_log_params
    params.require(:update_log).permit(:content)
  end
end
