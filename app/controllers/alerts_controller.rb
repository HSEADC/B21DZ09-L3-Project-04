class AlertsController < ApplicationController
  def show
  end

  def set_unpassed
    @alert = current_user.alert
    @alert.update(passed: false)
    @alert.increment!(:count)

    respond_to do |format|
      if @alert.update(passed: false)
        format.html { redirect_to welcome_url}
    end
  end
end

def set_passed
    @alert = current_user.alert
    @alert.update(passed: true)

    respond_to do |format|
      if @alert.update(passed: true)
        format.html { redirect_to welcome_url}
    end
  end
end

def set_blocked
    @alert = current_user.alert
    @alert.update(blocked: true)

    respond_to do |format|
      if @alert.update(blocked: true)
        format.html { redirect_to welcome_url}
    end
  end
end
end
