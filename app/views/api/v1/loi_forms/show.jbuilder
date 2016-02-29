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

json.contact_info do
  json.organization @loi_form.organization
  json.address @loi_form.address
  json.phone @loi_form.phone
  json.website @loi_form.website
  json.executive @loi_form.executive
  json.executive_phone @loi_form.executive_phone
  json.executive_email @loi_form.executive_email
  json.contact @loi_form.contact
  json.contact_phone @loi_form.contact_phone
  json.contact_email @loi_form.contact_email
end

json.organization do
  json.employees @loi_form.employees
  json.volunteers @loi_form.volunteers
  json.board @loi_form.board
  json.budget @loi_form.budget
  json.affiliated @loi_form.affiliated
end

json.mission @loi_form.mission
json.vision @loi_form.vision
json.concerns @loi_form.concerns

json.challenges do
  json.board do
    json.actual_staff_board @loi_form.actual_staff_board
    json.current_staff_board @loi_form.current_staff_board
    json.projected_board @loi_form.projected_staff_board
    json.board_challenge_1 @loi_form.board_challenge_1
    json.board_1_priority @loi_form.board_1_priority
    json.board_challenge_2 @loi_form.board_challenge_2
    json.board_2_priority @loi_form.board_2_priority
    json.board_challenge_3 @loi_form.board_challenge_3
    json.board_3_priority @loi_form.board_3_priority
  end
  
  json.operations do
    json.actual_staff_operations @loi_form.actual_staff_operations
    json.current_staff_operations @loi_form.current_staff_operations
    json.projected_operations @loi_form.projected_staff_operations
    json.operations_challenge_1 @loi_form.operations_challenge_1
    json.operations_1_priority @loi_form.operations_1_priority
    json.operations_challenge_2 @loi_form.operations_challenge_2
    json.operations_2_priority @loi_form.operations_2_priority
    json.operations_challenge_3 @loi_form.operations_challenge_3
    json.operations_3_priority @loi_form.operations_3_priority
  end

  json.fund do
    json.actual_staff_fund @loi_form.actual_staff_fund
    json.current_staff_fund @loi_form.current_staff_fund
    json.projected_fund @loi_form.projected_staff_fund
    json.fund_challenge_1 @loi_form.fund_challenge_1
    json.fund_1_priority @loi_form.fund_1_priority
    json.fund_challenge_2 @loi_form.fund_challenge_2
    json.fund_2_priority @loi_form.fund_2_priority
    json.fund_challenge_3 @loi_form.fund_challenge_3
    json.fund_3_priority @loi_form.fund_3_priority
  end

  json.marketing do
    json.actual_staff_marketing @loi_form.actual_staff_marketing
    json.current_staff_marketing @loi_form.current_staff_marketing
    json.projected_marketing @loi_form.projected_staff_marketing
    json.marketing_challenge_1 @loi_form.marketing_challenge_1
    json.marketing_1_priority @loi_form.marketing_1_priority
    json.marketing_challenge_2 @loi_form.marketing_challenge_2
    json.marketing_2_priority @loi_form.marketing_2_priority
    json.marketing_challenge_3 @loi_form.marketing_challenge_3
    json.marketing_3_priority @loi_form.marketing_3_priority
  end

  json.strategic do
    json.actual_staff_strategic @loi_form.actual_staff_strategic
    json.current_staff_strategic @loi_form.current_staff_strategic
    json.projected_strategic @loi_form.projected_staff_strategic
    json.strategic_challenge_1 @loi_form.strategic_challenge_1
    json.strategic_1_priority @loi_form.strategic_1_priority
    json.strategic_challenge_2 @loi_form.strategic_challenge_2
    json.strategic_2_priority @loi_form.strategic_2_priority
    json.strategic_challenge_3 @loi_form.strategic_challenge_3
    json.strategic_3_priority @loi_form.strategic_3_priority
  end

  json.technology do
    json.actual_staff_technology @loi_form.actual_staff_technology
    json.current_staff_technology @loi_form.current_staff_technology
    json.projected_technology @loi_form.projected_staff_technology
    json.technology_challenge_1 @loi_form.technology_challenge_1
    json.technology_1_priority @loi_form.technology_1_priority
    json.technology_challenge_2 @loi_form.technology_challenge_2
    json.technology_2_priority @loi_form.technology_2_priority
    json.technology_challenge_3 @loi_form.technology_challenge_3
    json.technology_3_priority @loi_form.technology_3_priority
  end

  json.other do
    json.actual_staff_other @loi_form.actual_staff_other
    json.current_staff_other @loi_form.current_staff_other
    json.projected_other @loi_form.projected_staff_other
    json.other_challenge_1 @loi_form.other_challenge_1
    json.other_1_priority @loi_form.other_1_priority
    json.other_challenge_2 @loi_form.other_challenge_2
    json.other_2_priority @loi_form.other_2_priority
    json.other_challenge_3 @loi_form.other_challenge_3
    json.other_3_priority @loi_form.other_3_priority
  end
end

json.additional @loi_form.additional
json.referral @loi_form.referral
json.sectors @loi_form.sectors
json.other_sectors @loi_form.other_sectors
json.geo_focus @loi_form.geo_focus
json.other_geo_focus @loi_form.other_geo_focus
