class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update_status
    @user = User.find(params[:id])
    @user.update(isBanned: params[:isBanned])
    redirect_to @user
  end

  private

  def users_params
    params.require(:user).permit(:email, :isBanned)
  end
end
