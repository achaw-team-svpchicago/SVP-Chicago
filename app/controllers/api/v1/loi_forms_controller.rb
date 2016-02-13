class Api::V1::LoiFormsController < ApplicationController

  def show
    loi_form = LoiForm.find_by(id: params[:id])
    render json: {
      user_id: current_user.id,
      loi_form: {
        name: loi_form.name,
        email: loi_form.email,
        answers: loi_form.answers
      }
    }
  end

  def create_loi_rating
    new_ratings = params[:ratings]
    loi_rating = LoiRating.new({
      user_id: new_ratings[:userId],
      loi_form_id: new_ratings[:loiFormId],
      q1_rating: new_ratings[:q1],
      q2_rating: new_ratings[:q2],
      q3_rating: new_ratings[:q3],
      q4_rating: new_ratings[:q4],
      q5_rating: new_ratings[:q5]
    })
    puts loi_rating.save
    render json: nil
  end
end