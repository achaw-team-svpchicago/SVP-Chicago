class Answer < ActiveRecord::Base
  belongs_to :loi_form
  belongs_to :rfp_from
end
