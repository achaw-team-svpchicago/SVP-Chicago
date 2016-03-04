json.user do
  json.id @user.id
  json.email @user.email
  json.firstName @user.first_name
  json.lastName @user.last_name
  json.confirmed @user.confirmed
  json.superAdmin @user.super_admin
end