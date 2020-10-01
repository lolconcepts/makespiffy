class SpiffyTasksController < ApplicationController
  before_action :set_spiffy_task, only: [:show, :edit, :update, :destroy]

  # GET /spiffy_tasks
  # GET /spiffy_tasks.json
  def index
    @spiffy_tasks = SpiffyTask.all
  end

  # GET /spiffy_tasks/1
  # GET /spiffy_tasks/1.json
  def show
  end

  # GET /spiffy_tasks/new
  def new
    @spiffy_task = SpiffyTask.new
  end

  # GET /spiffy_tasks/1/edit
  def edit
  end

  # POST /spiffy_tasks
  # POST /spiffy_tasks.json
  def create
    @spiffy_task = SpiffyTask.new(spiffy_task_params)

    respond_to do |format|
      if @spiffy_task.save
        format.html { redirect_to @spiffy_task, notice: 'Spiffy task was successfully created.' }
        format.json { render :show, status: :created, location: @spiffy_task }
      else
        format.html { render :new }
        format.json { render json: @spiffy_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spiffy_tasks/1
  # PATCH/PUT /spiffy_tasks/1.json
  def update
    respond_to do |format|
      if @spiffy_task.update(spiffy_task_params)
        format.html { redirect_to @spiffy_task, notice: 'Spiffy task was successfully updated.' }
        format.json { render :show, status: :ok, location: @spiffy_task }
      else
        format.html { render :edit }
        format.json { render json: @spiffy_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spiffy_tasks/1
  # DELETE /spiffy_tasks/1.json
  def destroy
    @spiffy_task.destroy
    respond_to do |format|
      format.html { redirect_to spiffy_tasks_url, notice: 'Spiffy task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def print_task
    @st = SpiffyTask.find(params[:id])
    render layout: false
  end

  def print_all_cards
    @cards = SpiffyTask.all
    render layout: false
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spiffy_task
      @spiffy_task = SpiffyTask.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spiffy_task_params
      params.require(:spiffy_task).permit(:name, :description, :value, :active, :redemptions)
    end
end
