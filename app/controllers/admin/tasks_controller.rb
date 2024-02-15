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

    @task = Task.new(params.require(:task).permit(:type, :created_at, :colour_hex, :vector_shape, :vector_regularity, :vector_font, :texture_image))

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
      if @task.update(task_params)
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

    def task_params
      params.require(:task).permit(:type, :created_at, :colour_hex, :vector_shape, :vector_regularity, :vector_font, :texture_image)
    end

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

      p.permit(:type, :created_at, :colour_hex, :vector_shape, :vector_regularity, :vector_font, :texture_image)
      #p.permit!(:type)
    end
end
