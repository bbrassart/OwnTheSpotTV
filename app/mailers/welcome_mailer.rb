class WelcomeMailer < ApplicationMailer
  default from: 'ownthespotofficial@gmail.com'
  def welcome_email(skater)
    @skater = skater
    mail(to: @skater.email, subject: 'Welcome #{@skater.username}')
  end
end
