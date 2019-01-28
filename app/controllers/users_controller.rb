class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update]
  before_action :check_autorization, only: [:edit, :update]
  before_action :set_user, except: [:index]

  def index
    @users = User.all
  end

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
      flash.now[:alert] = "User is unbanned"
      render :show
    else
      @user.update_attributes(banned: true)
      flash.now[:alert] = "User is banned"
      render :show
      UserEmailMailer.update_ban_status_notify(@user.email).deliver
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
      params.require(:user).permit(:first_name, :last_name, :about, :avatar, :email, :all_tags)
  end

end
