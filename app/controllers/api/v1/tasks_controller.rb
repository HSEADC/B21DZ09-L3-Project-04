class Api::V1::TasksController < Api::V1::ApplicationController

  def index
    @tasks = Task.all

    # продвинутый
    # render json: @pins.map { |pin| pin.api_as_json }
  end

  def show
    @task = Task.find(params[:id])
  end

end
