class LoiFormsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @loi_forms = LoiForm.all
  end

  def show
    @loi_form = LoiForm.find_by(id: params[:id])
  end

  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to '/'
    end
  end
end
