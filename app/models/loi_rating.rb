class LoiRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :loi_form

  validates :q1_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :q2_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :q3_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :q4_rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :q5_rating, inclusion: {in: ["Yes", "Maybe", "No"]}

  def average
    sum = q1_rating + q2_rating + q3_rating + q4_rating
    (sum / 4.0).round(2)
  end
end
