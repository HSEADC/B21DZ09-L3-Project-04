class TasksController < ApplicationController
  before_action :set_task, only: %i[ show, answersGallery]

  def index
    @tasks = Task.all

    # Meta
    set_meta_tags(
      title: "Все задания",
      description: "Здесь собраны все задания команды refs",
      keywords: "refs, reference, creative, tasks"
    )
    # end
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:id])

    # Meta
    set_meta_tags(
      title: "Задание",
      description: "Зацени это задание от refs!",
      keywords: "refs, reference, creative, task"
    )
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    def sti_task_params
      p = nil

      if params[:task]
        p = params.require(:task)
      elsif params[:colour_task]
        p = params.require(:colour_task)
      elsif params[:regularity_task]
        p = params.require(:regularity_task)
      elsif params[:shape_task]
        p = params.require(:shape_task)
      elsif params[:font_task]
        p = params.require(:font_task)
      elsif params[:texture_task]
        p = params.require(:texture_task)
      end

      p.permit(:first_answer_image, :colour_hex, :vector_shape, :vector_font, :vector_regularity, :texture_image, :name)
    end

end
