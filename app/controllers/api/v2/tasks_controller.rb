class Api::V2::TasksController < Api::V2::ApplicationController

  def index
    @tasks = Task.all

    # продвинутый
    # render json: @pins.map { |pin| pin.api_as_json }
  end

  # def show
  #   @task = Task.find(params[:id])
  # end

end
