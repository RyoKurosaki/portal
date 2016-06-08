class ApplyService < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  belongs_to :activity_service

  validates :name, length: { maximum: 30 }, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "English letter and space is only allowed." }
  validates :tel, length: { minimum: 10, maximum: 12 }, presence: true, numericality: { only_integer: true }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :expected_date, presence: true
end
