class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]
  before_action :check_autorization, only: [:edit, :update]
  before_action :set_user

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:alert] = "somethig wrong"
      render :edit
    end
  end

  def update_ban_status
    @user = User.find(params[:id])
    if @user.banned
      @user.update_attributes(banned: false)
    else
      @user.update_attributes(banned: true)
    end

  end

  private

  def check_autorization
    unless current_user.id == params[:id].to_i
      redirect_to root_url
    end

  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :about, :avatar, :email)
  end

end
