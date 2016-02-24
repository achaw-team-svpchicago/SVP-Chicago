json.partners @partners do |partner|
  json.email partner.email
  json.confirmed partner.confirmed
end

json.admins @admins do |admin|
  json.email admin.email
  json.confirmed admin.confirmed
end