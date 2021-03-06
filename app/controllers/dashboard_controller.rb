class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @waiting = Chore.all.where("status_id < ?",4).where("status_id > ?", 1).count
    @completed_today = Chore.all.where("status_id = ?",2).where(:user_id => current_user.id).where(:created_at => Date.today.beginning_of_day..Date.today.end_of_day)
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

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
      redirect_to all_users_url, notice: "User Deleted"
    end
  end

  def locked
  end

  def all_tasks
    @tasks = SpiffyTask.all
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
