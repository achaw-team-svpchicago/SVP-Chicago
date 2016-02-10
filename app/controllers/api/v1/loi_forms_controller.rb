class Api::V1::LoiFormsController < ApplicationController

  def show
    loi_form = LoiForm.find_by(id: params[:id])
    render json: {
      name: loi_form.name,
      email: loi_form.email,
      answers: loi_form.answers
    }
  end
end