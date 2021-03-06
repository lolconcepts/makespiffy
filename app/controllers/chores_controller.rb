class ChoresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chore, only: [:show, :edit, :update, :destroy]

  # GET /chores
  # GET /chores.json
  def index
    @chores = Chore.all.where("status_id < ?", 4).where("status_id > ?", 1)
  end

  # GET /chores/1
  # GET /chores/1.json
  def show
  end

  # GET /chores/new
  def new
    @chore = Chore.new
    @chore.user_id = current_user.id
    @spid = params[:id]
    @st = SpiffyTask.find(@spid)
    @chore.spiffy_task = @st
    @eligible = @chore.eligible
    # Duplicate Detector
    # if the same chore has been submitted for today
    @duplicate = Chore.all.where(:user_id => current_user.id).where(:created_at => Date.today.all_day).count
  end

  # GET /chores/1/edit
  def edit
  end

  # POST /chores
  # POST /chores.json
  def create
    @chore = Chore.new(chore_params)
    @chore.status_id = 2
    respond_to do |format|
      if @chore.save
        format.html { redirect_to root_url, notice: 'Chore was successfully created.' }
        format.json { render :show, status: :created, location: @chore }
      else
        format.html { render :new }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update
    respond_to do |format|
      if @chore.update(chore_params)
        format.html { redirect_to @chore, notice: 'Chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @chore }
      else
        format.html { render :edit }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @chore.destroy
    respond_to do |format|
      format.html { redirect_to chores_url, notice: 'Chore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def all_chores
    @chores_today = Chore.all.where(:created_at => Date.today.all_day)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chore
      @chore = Chore.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def chore_params
      params.require(:chore).permit(:spiffy_task_id, :evidence, :status_id, :user_id)
    end
end
