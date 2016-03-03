class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    '/loi_forms'
  end

  protected

  def authenticate_admin!
    authenticate_confirmed!
    unless user_signed_in?
      redirect_to '/'
    end
  end

  def authenticate_super_admin!
    authenticate_confirmed!
    unless current_user.super_admin
      redirect_to '/'
    end
  end

  private

  def authenticate_confirmed!
    return unless user_signed_in?
    unless current_user.confirmed
      redirect_to '/users/edit'
      flash[:danger] = "Please update you password to confirm your account before viewing this page!"
    end
  end
end
