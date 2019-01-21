class FeedbacksMailer < ApplicationMailer

  def send_message(feedback)
    @feedback = feedback

    mail to: 'vidaspgar@gmail.com', subject: "Feedback form #{feedback.author}"
  end
end
