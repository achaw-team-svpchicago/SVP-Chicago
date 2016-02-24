class LoiFormsController < ApplicationController
  before_action :authenticate_user!, except: :create

  def index
    @loi_forms = LoiForm.all
  end

  

  def show
    @loi_form = LoiForm.find_by(id: params[:id])
  end
end
