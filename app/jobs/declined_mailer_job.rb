class DeclinedMailerJob < ActiveJob::Base
  queue_as :default

  def perform(applying_info)
    DeclinedMailer.declined(applying_info).deliver_now
  end
end
