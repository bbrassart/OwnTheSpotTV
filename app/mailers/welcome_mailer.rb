class WelcomeMailer < ApplicationMailer
  default from: 'ownthespotofficial@gmail.com'

  def welcome_email(skater)
    @skater = skater
    mail(to: @skater.email, subject: 'Welcome to the OwnTheSpot.TV family!')
  end

  def user_added_video(video)
    @video = video
    mail(to: 'ownthespotofficial@gmail.com')
  end

  def poser_button(video, skater)
    @skater = skater
    @video = video
    mail(to: 'ownthespotofficial@gmail.com', subject: "Poser reported")
  end
end
