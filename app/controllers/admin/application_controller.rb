class Admin::ApplicationController < ApplicationController
  load_and_authorize_resource
  before_action :check_admin
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_path, notice: exception.message }
    end
  end

  def check_admin 
    redirect_to root_path unless current_user.admin
  end
end