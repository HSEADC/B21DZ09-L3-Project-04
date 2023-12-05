class PolyCommentsController < ApplicationController

  # POST /comments or /comments.json
  def create
    # @answer = Answer.find(params[:answer_id])
    @poly_comment = PolyComment.new(body: params[:comment][:body], user_id: current_user.id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to task_url(@comment.answer.task), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    def set_task
      @task = Task.find(params[:task_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body).merge(user_id: current_user.id)
    end
end
