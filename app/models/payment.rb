class Payment < ActiveRecord::Base
  belongs_to :activity_service

  validates :email, presence: true
  validates :tel, presence: true
end
