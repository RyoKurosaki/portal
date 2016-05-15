class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, length: { maximum: 30 }, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "英文字のみが使用できます" }
  validates :tel, length: { minimum: 10, maximum: 12 }, presence: true, numericality: { only_integer: true }
  validates :line, format: { with: /\A[a-zA-Z0-9]+\z/i, message: "英数字のみが使用できます" }, allow_blank: true
  validates :facebook, format: /\A#{URI::regexp(%w(https))}\www.facebook.com/, allow_blank: true
end
