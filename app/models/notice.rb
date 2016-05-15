class Notice < ActiveRecord::Base
  validates :text, presence: true
end
