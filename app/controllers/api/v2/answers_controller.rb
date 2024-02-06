class  Api::V2::AnswersController <  Api::V2::ApplicationController

  def index
    @answers = Answer.all
  end

  def show
    @task = Task.find(params[:task_id])
    @comment = Comment.new
  end

  def create

    puts "======================="
    puts "REQUEST FROM FRONTEND"
    puts "======================="

    @USER = User.find_by_jti(params[:jti])

    @task = Task.find(params[:task_id])
      @answer = @task.answers.new(answer_image: params[:answer_image], user_id: current_user.id, description:params[:description])

    respond_to do |format|
      if @answer.save
        format.json { render json: @answer.as_json }
      else
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

end
