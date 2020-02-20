class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @waiting = Chore.all.where("status_id < ?",4).where("status_id > ?", 1).count
  end
  def all_users
    @users = User.all
  end
  def adminify
    @user = User.find(params[:id])
    @user.makeAdmin 
    flash[:notice] = "#{@user.fullname} has been granted Admin Rights."
    redirect_to all_users_url
  end
  def approve
    @chore = Chore.find(params[:cid])
    @chore.payOut
    flash[:notice] = "#{@chore.spiffy_task.name} has been approved."
    redirect_to chores_url
  end

  def reject
    @chore = Chore.find(params[:cid])
    @chore.status_id = 1
    @chore.save
    flash[:notice] = "#{@chore.spiffy_task.name} has been rejected."
    redirect_to chores_url
  end
end
