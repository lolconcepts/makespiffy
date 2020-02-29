class CashoutsController < ApplicationController
  before_action :set_cashout, only: [:show, :edit, :update, :destroy]

  # GET /cashouts
  # GET /cashouts.json
  def index
    @cashouts = Cashout.all.where(:paid => false)
  end

  # GET /cashouts/1
  # GET /cashouts/1.json
  def show
  end

  # GET /cashouts/new
  def new
    @outstanding = Cashout.all.where(:paid => false).where(:user_id => current_user.id).count
    @cashout = Cashout.new
    @cashout.user_id = current_user.id
  end

  # GET /cashouts/1/edit
  def edit
  end

  # POST /cashouts
  # POST /cashouts.json
  def create
    
      @cashout = Cashout.new(cashout_params)

    respond_to do |format|
      if @cashout.amount.to_i <= current_user.bank.to_i && @cashout.save
        format.html { redirect_to root_url, notice: 'Cashout was successfully created.' }
        format.json { render :show, status: :created, location: @cashout }
      else
        format.html { render :new, notice: 'you do not have enough in your bank.' }
        format.json { render json: @cashout.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
    request = Cashout.find(params[:id])
    user = request.user
    amount = request.amount.to_i
    if user.cashOut(amount)
      request.paid = true
      request.save
      redirect_to cashouts_url, :notice => "Cashed out #{amount} for #{user.fullname}"
    else
      redirect_to cashouts_url, :notice => "An error occurred!"
    end
  end

  def reject
    request = Cashout.find(params[:id])
    request.destroy
    redirect_to cashouts_url, :notice => "Deleted Request"
  end

  # PATCH/PUT /cashouts/1
  # PATCH/PUT /cashouts/1.json
  def update
    respond_to do |format|
      if @cashout.update(cashout_params)
        format.html { redirect_to @cashout, notice: 'Cashout was successfully updated.' }
        format.json { render :show, status: :ok, location: @cashout }
      else
        format.html { render :edit }
        format.json { render json: @cashout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashouts/1
  # DELETE /cashouts/1.json
  def destroy
    @cashout.destroy
    respond_to do |format|
      format.html { redirect_to cashouts_url, notice: 'Cashout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cashout
      @cashout = Cashout.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cashout_params
      params.require(:cashout).permit(:user_id, :amount, :paid)
    end
end
