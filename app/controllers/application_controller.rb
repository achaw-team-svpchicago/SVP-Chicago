class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    '/loi_forms'
  end

  protected

  def authenticate_admin!
    if user_signed_in?
      authenticate_confirmed!
    else
      redirect_to '/users/sign_in'
    end
  end

  def authenticate_super_admin!
    if user_signed_in?
      authenticate_confirmed!
      redirect_to '/' unless current_user.super_admin
    else
      redirect_to '/users/sign_in'
    end
  end

  private

  def authenticate_confirmed!
    begin
      return unless user_signed_in?
      unless current_user.confirmed
        redirect_to '/users/edit'
        flash[:danger] = "Please update your password to confirm your account before viewing this page!"
      end
    rescue NoMethodError
      redirect_to '/users/sign_in'
    end
  end
end
