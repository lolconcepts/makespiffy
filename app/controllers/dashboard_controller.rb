class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
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
end
