class Payment < ActiveRecord::Base
  belongs_to :activity_service
  belongs_to :apply_service


end
