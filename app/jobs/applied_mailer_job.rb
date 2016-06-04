class AppliedMailerJob < ActiveJob::Base
  queue_as :default

  def perform(applying_info)
    AppliedMailer.applied(applying_info).deliver_now
    CheckScheduleMailer.check_schedule(applying_info).deliver_now
  end
end
