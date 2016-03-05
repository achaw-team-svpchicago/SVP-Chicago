class LoiForm < ActiveRecord::Base
  has_many :answers
  has_many :loi_ratings
  validates :organization, presence: true
  validates :executive, presence: true
  validates :executive_email, presence: true
  validates :contact, presence: true
  validates :contact_email, presence: true
  validates_length_of :affiliated, maximum: 50, too_long: '- Please limit your response to 50 words.', tokenizer: ->(str) { str.scan(/\w+/) }
  validates_length_of :mission, maximum: 500, too_long: '- Please limit your response to 500 words.', tokenizer: ->(str) { str.scan(/\w+/) }
  validates_length_of :vision, maximum: 500, too_long: '- Please limit your response to 500 words.', tokenizer: ->(str) { str.scan(/\w+/) }
  validates_length_of :concerns, maximum: 250, too_long: '- Please limit your response to 250 words.', tokenizer: ->(str) { str.scan(/\w+/) }
  validates_length_of :additional, maximum: 250, too_long: '- Please limit your response to 250 words.', tokenizer: ->(str) { str.scan(/\w+/) }
  validates :employees, numericality: { only_integer: true }
  validates :volunteers, numericality: { only_integer: true }
  validates :board, numericality: { only_integer: true }


  def rated_by?(user)
    loi_ratings.where(user_id: user.id).exists?
  end
end
