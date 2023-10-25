class Admin::AnswersController < ApplicationController
  load_and_authorize_resource
  before_action :set_answer, only: %i[ show edit update destroy ]

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1 or /answers/1.json
  def show
    @comment = Comment.new
  end

  # GET /answers/new
  def new
    @task = Task.find(params[:task_id])
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
    # @task = @answer.task
  end

  # POST /answers or /answers.json
  def create
    @task = Task.find(params[:task_id])
    @answer = @task.answers.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to admin_task_url(@answer.task), notice: "answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to admin_task_url(@answer.task), notice: "answer was successfully updated." }
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
      format.html { redirect_to admin_task_url(@task), notice: "answer was successfully destroyed." }
      format.json { head :no_content }
    end
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
      params.require(:answer).permit(:description, :answer_image).merge(user_id: current_user.id)
    end
end
