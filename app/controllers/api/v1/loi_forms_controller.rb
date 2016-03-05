class Api::V1::LoiFormsController < ApplicationController
  before_action :authenticate_admin!
  before_action :authenticate_super_admin!, only: [:review_ratings]

  def show
    @loi_form = LoiForm.find_by(id: params[:id])
    @loi_rating = @loi_form.loi_ratings.find_by(user_id: current_user.id)
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
      q5_rating: new_ratings[:q5],
      comment: new_ratings[:comment]
    })
    if loi_rating.save # should be refactored to render jbuilder
      render json: {
        average_rating: loi_rating.average,
        invited: loi_rating.q5_rating
      }
    else
      render json: loi_rating.errors.to_json, status: :unprocessable_entity
    end
  end

  def review_ratings
    @ratings = LoiRating.where(loi_form_id: params[:id])
  end
end