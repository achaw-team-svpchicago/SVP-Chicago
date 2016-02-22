class NonprofitsController < ApplicationController
  def home
  end

  def loi_form
    @loi_form = LoiForm.new
  end

  def create
    loi_form_params = params.to_hash.delete_if do |key, value| 
      key == "authenticity_token" || key == "controller" || key == "action"
    end
    puts "==========================================="
    puts loi_form_params
    puts "==========================================="

    @loi_form = LoiForm.new(loi_form_params)
    # @loi_form = LoiForm.new(
    #   organization: params[:organization],
    #   address: params[:address],
    #   phone: params[:phone],
    #   website: params[:website],
    #   executive: params[:executive],
    #   executive_phone: params[:executive_phone],
    #   executive_email: params[:executive_email],
    #   contact: params[:contact],
    #   contact_phone: params[:contact_phone],
    #   contact_email: params[:contact_email]
    #   )

    if @loi_form.save
      flash[:success] = "Success! You've successfully submitted a letter of interest to SVP Chicago."
      redirect_to '/'
    else
      @loi_form.errors.full_messages.each do |error|
        flash[:warning] = error
      end
      render :action => 'loi_form'
    end
  end

end