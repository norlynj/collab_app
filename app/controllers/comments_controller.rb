class CommentsController < ApplicationController
  before_action :authenticate_user
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.build(comment_params)
    if @comment.save
      # Handle successful comment creation
      redirect_to @task, notice: 'Comment was successfully created.'
    else
      # Handle validation errors
      flash.now[:alert] = 'Failed to create comment.'
      render 'tasks/show'
    end
  end

  # Other controller actions

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
