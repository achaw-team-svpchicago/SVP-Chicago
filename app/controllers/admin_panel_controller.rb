require 'pry-rails'

class AdminPanelController < ApplicationController
  before_action :authenticate_super_admin!

  def show

  end

  def invite_user
    password = SecureRandom.hex
    user = User.new({
      first_name: params[:firstName],
      last_name: params[:lastName],
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

  def update_user
    user = User.find_by(id: params[:id])
    updated_attributes = params[:admin_panel]
    if user.update({
      email: updated_attributes[:email], 
      first_name: updated_attributes[:first_name], 
      last_name: updated_attributes[:last_name]
      })
      render json: user, status: :ok
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end
end
