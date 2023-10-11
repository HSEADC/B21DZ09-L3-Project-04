class CommentsController < ApplicationController
  def create
		@task = Task.find(params[:task_id])
		@comment = @task.comments.create(params[:comment].permit(:commenter, :body))
		redirect_to tasks_path(@task)
	end

  def destroy
		@task = Task.find(params[:task_id])
		@comment = @task.comments.find(params[:id])
		@comment.destroy
		redirect_to tasks_path(@task)
	end
end
