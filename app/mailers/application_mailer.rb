class ApplicationMailer < ActionMailer::Base
  default from: %{TestGuru <vidaspgar@gmail.com>}
  layout 'mailer'
end
