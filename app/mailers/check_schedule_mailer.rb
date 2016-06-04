class CheckScheduleMailer < ApplicationMailer
  def check_schedule(applying_info)
    @apply_services = applying_info
    mail(to: ENV['compass_email'], subject: applying_info.activity_service.name + 'の申し込み')
  end
end
