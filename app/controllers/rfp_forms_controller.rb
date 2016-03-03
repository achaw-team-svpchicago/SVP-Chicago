class RfpFormsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @rfp_forms = RfpForm.all
  end
  
  def show
    @rfp_form = RfpForm.find(params[:id])
  end
  
  def rfp_form
    @rfp_form = RfpForm.new
  end
  
  def create
    @rfp_form = RfpForm.new(rvp_params)
  end
  
  
  def rfp_params
    params.require(:rfp_form).permit(:organization,
      :address
    )
  end


end
