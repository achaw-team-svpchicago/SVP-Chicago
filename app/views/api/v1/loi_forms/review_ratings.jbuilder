json.ratings @ratings do |rating|
  json.user do
    json.name rating.user.full_name
    json.superAdmin rating.user.super_admin
  end
  json.q1 rating.q1_rating
  json.q2 rating.q2_rating
  json.q3 rating.q3_rating
  json.q4 rating.q4_rating
  json.q5 rating.q5_rating
  json.average rating.average
end