json.user do
  json.rated @loi_form.rated_by?(current_user)
  if @loi_rating
    json.average_rating @loi_rating.average
    json.invited @loi_rating.q5_rating
  end
end

json.loi_form do
  json.name @loi_form.name
  json.email @loi_form.email
  json.answers @loi_form.answers do |answer|
    json.question answer.question
    json.answer answer.answer
  end
end