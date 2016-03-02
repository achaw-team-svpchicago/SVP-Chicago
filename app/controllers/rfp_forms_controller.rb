class RfpFormsController < ApplicationController
  before_action :authenticate_admin!
  
  def rfp_form
    @rfp_form = RvpForm.new
  end


end
