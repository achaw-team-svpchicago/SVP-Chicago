class LoiRating < ActiveRecord::Base
  belongs_to :user
  belongs_to :loi_form

end
