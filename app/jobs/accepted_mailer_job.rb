class AcceptedMailerJob < ActiveJob::Base
  queue_as :default

  def perform(applying_info)
    AcceptedMailer.accepted(applying_info).deliver_now
  end
end
