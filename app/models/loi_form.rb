class LoiForm < ActiveRecord::Base
  has_many :answers
  has_many :loi_ratings

end
