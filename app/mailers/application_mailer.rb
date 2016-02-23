class ApplicationMailer < ActionMailer::Base
  default from: ENV["SVP_EMAIL"]
  layout 'mailer'
end
