class UserEmailMailer < ApplicationMailer
  default :from => "localhost:3000"

  def update_ban_status_notify(email)
    # @user = User.find(params[:id])
    mail(:to => email, :subject => "BAN")
  end

end
