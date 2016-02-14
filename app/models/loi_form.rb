class LoiForm < ActiveRecord::Base
  has_many :answers
  has_many :loi_ratings

  def rated_by?(user)
    loi_ratings.where(user_id: user.id).exists?
  end
end
