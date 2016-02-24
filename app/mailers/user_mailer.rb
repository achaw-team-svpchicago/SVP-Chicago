class UserMailer < ApplicationMailer
  def self.email_invitation(invited_user, temp_password)
    password = temp_password
    mg_client = Mailgun::Client.new ENV["MAILGUN_API_KEY"]
    message_params = {
      from: "SVP Chicago <#{ENV['MAILGUN_USER_NAME']}>",
      to: invited_user.email,
      subject: "Welcome to SVP",
      text: "You have been invited to SVP Chicago. Your temporary password is: \n
      #{password}\n
      You will need to confirm your account in order to review nonprofits. Please follow the below link and update you password to do so. \n 
      <a href='#{ENV['ENVIRONMENT_URL']}/users/edit/&event=welcome'> \n
      Thank you!"
    }    
    mg_client.send_message(ENV["MAILGUN_DOMAIN"], message_params)
  end
end