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
    # Meta
    set_meta_tags(
      title: "Задание",
      description: "Зацени это задание от refs!",
      keywords: "refs, reference, creative, task"
    )
    # end
  end

  def toggle_marked
    set_task

    task_user_ids = []

    @task.users_who_marked.each do |user|
      task_user_ids << user.id
    end

    if task_user_ids.include?(current_user.id)
      current_user.tasks_i_marked.destroy(@task)
    else
      current_user.tasks_i_marked << @task
    end

    set_task
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
