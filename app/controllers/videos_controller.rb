class VideosController  < ApplicationController

  before_action :check_if_banned, only:[:index]

  def index

  end

  private

  def check_if_banned
    if current_user && current_user.banned?
      # @user = User.find(params[:id])
      user_id = current_user.id
      if User.find(user_id)
        sign_out(current_user)
        redirect_to "/banned/#{user_id}"
        # redirect_to destroy_user_session_path(@user) #{}"/banned/#{@user.id}"
        # destroy_user_session
      end
    end
  end

  def user_params
      params.require(:user).permit(:first_name, :last_name, :about, :avatar, :email)
  end

end
