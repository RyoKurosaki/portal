class Payment < ActiveRecord::Base
  belongs_to :activity_service
  belongs_to :apply_service

  validates_uniqueness_of :apply_service_id, :message => ['payment is allowed once by once apply']
end
