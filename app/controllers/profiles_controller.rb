class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]

  def show
    @user_answers = Answer.where(user_id: current_user.id)
    @win_tasks = Task.where(active: false).take(4)
    @all_likes = current_user.answers_i_liked.length


    # Meta
    set_meta_tags(
      title: "Профиль",
      description: "Мои достижения с refs",
      keywords: "refs, reference, creative, profile"
    )
    # end
  end

  def edit
    @profile = current_user.profile
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      email = current_user.email
      birthday = current_user.birthday
      tg = current_user.tg
      params.require(:profile).permit(:username, :email, :birthday, :tg)
    end
end
