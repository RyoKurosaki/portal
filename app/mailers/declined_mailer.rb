class DeclinedMailer < ApplicationMailer
  def declined(applying_info)
    @apply_services = applying_info
    mail(to: applying_info.email, subject: 'Your applying was declined.')
  end
end
