class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all

    # Meta
    set_meta_tags(
      title: "Все комментарии",
      description: "Здесь собраны все комментарии пользователей refs",
      keywords: "refs, reference, creative, comments"
    )
    # end
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    # @answer = Answer.find(params[:answer_id])
    @task = Task.find(params[:task_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @answer = @comment.answer
  end

  # POST /comments or /comments.json
  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new(body: params[:body], user_id: current_user.id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to task_url(@answer.task), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to task_url(@answer.task), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @task = @comment.answer.task
    @answer = @comment.answer
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to task_url(@comment.answer.task), notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
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
