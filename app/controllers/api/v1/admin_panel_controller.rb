class Api::V1::AdminPanelController < ApplicationController
  before_action :authenticate_super_admin!

  # All methods render jbuilder on the happy path

  def show
    @users = User.all
  end

  def toggle_admin_rights
    @user = User.find_by(id: params[:id])
    render json: @user.errors unless @user.update({super_admin: !@user.super_admin})
  end

  def delete_user
    @user = User.find_by(id: params[:id])

    begin
      @user.destroy
    rescue NoMethodError # Should return 404 if user not found
      render json: nil, status: :not_found
    end
  end

  def update_user
    @user = User.find_by(id: params[:id])
    unless @user.update(params[:admin_panel].permit(:first_name, :last_name, :email)) #research stron parameters
      render json: @user.errors, status: :unprocessable_entity 
    end
  end  

  def invite_user
    password = SecureRandom.hex # generates random password
    @user = User.new({
      first_name: params[:firstName],
      last_name: params[:lastName],
      email: params[:email],
      super_admin: params[:super_admin],
      password: password
    })

    if @user.save
      UserMailer.email_invitation(@user, password) # refer to user_mailer
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def resend_activation
    password = SecureRandom.hex
    user = User.find_by(id: params[:id])
    UserMailer.email_invitation(user, password)
    render json: nil, status: :ok
  end
end