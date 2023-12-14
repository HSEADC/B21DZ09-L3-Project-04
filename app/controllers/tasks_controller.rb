class TasksController < ApplicationController
  before_action :set_task, only: %i[ show ]

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

end
