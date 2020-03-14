class BonusController < ApplicationController
  before_action :set_bonu, only: [:show, :edit, :update, :destroy]

  # GET /bonus
  # GET /bonus.json
  def index
    @bonus = Bonu.all
  end

  # GET /bonus/1
  # GET /bonus/1.json
  def show
  end

  # GET /bonus/new
  def new
    @bonu = Bonu.new
  end

  # GET /bonus/1/edit
  def edit
  end

  # POST /bonus
  # POST /bonus.json
  def create
    @bonu = Bonu.new(bonu_params)
    @user = @bonu.user

    respond_to do |format|
      if @bonu.save
        @user.addValue(@bonu.amount)
        format.html { redirect_to root_url, notice: 'Bonu was successfully created.' }
        format.json { render :show, status: :created, location: @bonu }
      else
        format.html { render :new }
        format.json { render json: @bonu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bonus/1
  # PATCH/PUT /bonus/1.json
  def update
    respond_to do |format|
      if @bonu.update(bonu_params)
        format.html { redirect_to @bonu, notice: 'Bonu was successfully updated.' }
        format.json { render :show, status: :ok, location: @bonu }
      else
        format.html { render :edit }
        format.json { render json: @bonu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bonus/1
  # DELETE /bonus/1.json
  def destroy
    @bonu.destroy
    respond_to do |format|
      format.html { redirect_to bonus_url, notice: 'Bonu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bonu
      @bonu = Bonu.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bonu_params
      params.require(:bonu).permit(:user_id, :amount)
    end
end
