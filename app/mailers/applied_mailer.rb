class AppliedMailer < ApplicationMailer
  def applied(applying_info)
    @apply_services = applying_info
    mail(to: applying_info.email, subject: 'Thank you for applying!')
  end
end
