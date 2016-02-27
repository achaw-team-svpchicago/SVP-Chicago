json.partners @partners do |partner|
  json.id partner.id
  json.email partner.email
  json.firstName partner.first_name
  json.lastName partner.last_name
  json.confirmed partner.confirmed
end

json.admins @admins do |admin|
  json.id admin.id
  json.email admin.email
  json.firstName admin.first_name
  json.lastName admin.last_name
  json.confirmed admin.confirmed
end