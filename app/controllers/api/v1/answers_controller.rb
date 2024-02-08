class  Api::V2::AnswersController <  Api::V2::ApplicationController

  def index
    @answers = Answer.all
  end

  def show
    @task = Task.find(params[:task_id])
    # @comment = Comment.new
  end

  def create

    puts "======================="
    puts "REQUEST FROM FRONTEND"
    puts "======================="

    @user = User.find_by_jti(decrypt_payload[0]['jti'])

    @task = Task.find(params[:task_id])
      @answer = @task.answers.new(answer_image: params[:answer_image], user_id: current_user.id, description:params[:description])

    if @answer.save
      render json: @answer.as_json
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def answer_params
    params.require(:answer).permit(:answer_image).merge(user_id: current_user.id)
  end
end
