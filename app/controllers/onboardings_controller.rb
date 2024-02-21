class OnboardingsController < ApplicationController
  def show
    @onboarding = Onboarding.find(params[:id])
  end

  def new
   @onboarding = Onboarding.new
  end

  def create
   @onboarding = Onboarding.new(onboarding_params)

    respond_to do |format|
      if @onboarding.save
        format.html { redirect_to welcome_url, notice: "Subscription was successfully created." }
        format.json { render :show, status: :created, location: @onboarding }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @onboarding.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_passed
    @onboarding = Onboarding.find(params[:id])
    @onboarding.update(passed: true)
  end

    private
    # Only allow a list of trusted parameters through.
    def onboarding_params
      params.require(:onboarding).permit(:passed)
    end

end
