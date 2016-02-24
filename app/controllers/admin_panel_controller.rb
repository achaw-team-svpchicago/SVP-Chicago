class AdminPanelController < ApplicationController
  before_action :authenticate_super_admin!

  def show

  end

  def invite_user
    password = SecureRandom.hex
    user = User.new({
      email: params[:email],
      super_admin: params[:super_admin],
      password: password
    })

    if user.save
      UserMailer.email_invitation(user, password)
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
end
