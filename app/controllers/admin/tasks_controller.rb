class Admin::TasksController < Admin::ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    #@task = Task.new(type: params[:task][:type], ref: params[:task][:ref], task_of_day: params[:task][:task_of_day], in_search: params[:task][:in_search], active: params[:task][:active], task_of_day: params[:task][:task_of_day], ending_at: params[:task][:ending_at])
    @task = Task.new(type: params[:task][:type], texture_image: params[:task][:texture_image], colour_task: params[:task][:colour_task], vector_font: params[:task][:vector_font], vector_regularity: params[:task][:vector_regularity], vector_shape: params[:task][:vector_shape])

    #@task = Task.new(sti_task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to admin_task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update

    respond_to do |format|
      if @task.update(sti_task_params)
        format.html { redirect_to admin_task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to admin_tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # def task_params
    #   params.require(:task).permit(:type, :created_at )
    # end

    # def colour_task_params
    #   params.require(:colour_task).permit(:type, :created_at, :colour_hex)
    # end

    # def shape_task_params
    #   params.require(:shape_task).permit(:type, :created_at, :vector_shape)
    # end

    # def regularity_task_params
    #   params.require(:regularity_task).permit(:type, :created_at, :vector_regularity)
    # end

    # def font_task_params
    #   params.require(:font_task).permit(:type, :created_at, :vector_font)
    # end

    # def texture_task_params
    #   params.require(:texture_task).permit(:type, :created_at, :texture_image)
    # end

      #p.permit(:type, :created_at)
      #p.permit(:type, :colour_hex, :vector_shape, :vector_font, :vector_regularity, :texture_image)
    #end

    def sti_task_params
      p = nil

      if params[:task]
        p = params.require(:task)
      elsif params[:colour_task]
        p = params.require(:colour_task)
      elsif params[:shape_task]
        p = params.require(:shape_task)
      elsif params[:regularity_task]
        p = params.require(:regularity_task)
        elsif params[:font_task]
        p = params.require(:font_task)
        elsif params[:texture_task]
        p = params.to_unsafe_h.require(:texture_task)
      end

      p.permit!(:type, :active, :ending_at, :in_search, :task_of_day, :ref, :texture_image, :colour_hex, :vector_font, :vector_regularity, :vector_shape)
      #p.permit!(:type)
    end

    def default_params

    end
end
