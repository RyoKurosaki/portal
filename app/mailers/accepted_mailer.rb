class AcceptedMailer < ApplicationMailer
  def accepted(applying_info)
    @apply_services = applying_info
    mail(to: applying_info.email, subject: 'Your applying was accepted!')
  end
end
