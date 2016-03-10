class AdminPanelController < ApplicationController
  before_action :authenticate_super_admin!

  def rfp_form
    @rfp_form = RvpForm.new
  end
  
  def show

  end
end
