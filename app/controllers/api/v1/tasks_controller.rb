class Api::V1::TasksController < Api::V1::ApplicationController

  def index
    @pins = Task.all

    # продвинутый
    # render json: @pins.map { |pin| pin.api_as_json }
  end

  def show
    @pin = Task.find(params[:id])
  end

end
