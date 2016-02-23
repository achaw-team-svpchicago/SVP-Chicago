class UserMailer < ApplicationMailer
  def self.email_invitation(invited_user, temp_password)
    @password = temp_password
    # mg_client = Mailgun::Client.new ENV["MAILGUN_API_KEY"]
    # message_params = {
    #   from: "SVP Chicago <#{ENV['MAILGUN_USER_NAME']}>",
    #   to: invited_user.email,
    #   subject: "Welcome to SVP",
    #   text: "heyyyy"
    # }    
    # mg_client.send_message(ENV["MAILGUN_DOMAIN"], message_params)

    RestClient.post "https://api:#{ENV['MAILGUN_API_KEY']}"\
    "@api.mailgun.net/v3/#{ENV['MAILGUN_DOMAIN']}/messages",
    :from => "SVP Chicago <#{ENV['MAILGUN_USER_NAME']}>",
    :to => invited_user.email,
    :subject => "Welcome to SVP Chicago",
    :text => "heeyyyy"
  end
end