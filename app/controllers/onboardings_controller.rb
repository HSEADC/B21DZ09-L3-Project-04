class OnboardingsController < ApplicationController
  def set_passed
    @onboarding = current_user.onboarding
    @onboarding.update(passed: true)

    respond_to do |format|
      if @onboarding.update(passed: true)
        format.html { redirect_to welcome_url}
    end
  end
end

end
