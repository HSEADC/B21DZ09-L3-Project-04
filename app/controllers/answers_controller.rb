class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy toggle_like]

  # GET /answers or /answers.json
  def index
    #@answers = Answer.all
    @task = Task.find(params[:task_id])
    @answers = Answer.where(task_id: @task.id).paginate(page: params[:page])

    # @comment = Comment.new
    # url = answer_comments_path(@answer, @comment)

    # Meta
    set_meta_tags(
      title: "Ответы",
      description: "Здесь собраны все ответы пользователей refs",
      keywords: "refs, reference, creative, answers"
    )
    # end
  end

  # GET /answers/1 or /answers/1.json
  def show
    @task = Task.find(params[:task_id])
    @answer = Answer.find(params[:id])
    @comment = Comment.new
    @url = answer_comments_path(@answer, @comment)
    # Meta
    set_meta_tags(
      title: "Ответ",
      description: "Зацени этот ответ на задание в refs",
      keywords: "refs, reference, creative, answer"
    )
    # end
  end

  # GET /answers/new
  def new
    @task = Task.find(params[:task_id])
    @answer = Answer.new
    #@answer = @task.answers.build
  end

  # GET /answers/1/edit
  def edit
     @task = @answer.task
  end

  # POST /answers or /answers.json
  def create
   @task = Task.find(params[:task_id])
    @answer = @task.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to task_url(@task), notice: "answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    @task = Task.find(params[:task_id])
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to task_url(@answer.task), notice: "answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @task = @answer.task
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to task_url(@task), notice: "answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

    def toggle_like
    answer_user_ids = []

    @answer.users_who_liked.each do |user|
      answer_user_ids << user.id
    end

    if answer_user_ids.include?(current_user.id)
      current_user.answers_i_liked.delete(@answer)
    else
      current_user.answers_i_liked << @answer
    end

    @answer = Answer.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_task
     @task = Task.find(params[:task_id])
   end

    # Only allow a list of trusted parameters through.
     def answer_params
      params.require(:answer).permit(:answer_image).merge(user_id: current_user.id)
    end
end
