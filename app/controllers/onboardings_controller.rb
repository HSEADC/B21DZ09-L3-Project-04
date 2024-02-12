class OnboardingsController < ApplicationController
  def show
    @onboarding = Onboarding.find(params[:id])
  end

  def set_passed
    @onboarding = Onboarding.find(params[:id])
    @onboarding.update(passed: true)
  end

end
