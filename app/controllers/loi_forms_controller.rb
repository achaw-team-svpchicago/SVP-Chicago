class LoiFormsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def show
    
  end

  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to '/'
    end
  end
end
