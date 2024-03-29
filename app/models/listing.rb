class Listing < ActiveRecord::Base
  validates_uniqueness_of :access_token
  validates_presence_of :access_token
  after_initialize :set_access_token

  validates :name, presence: true
  validates :address, presence: true
  validates :address_en, presence: true

  has_many :listing_details, ->{ order(:id) }
  accepts_nested_attributes_for :listing_details, allow_destroy: true, reject_if: :all_blank

  private
    def set_access_token
      self.access_token = self.access_token.blank? ? generate_access_token : self.access_token
    end

    def generate_access_token
      tmp_token = SecureRandom.urlsafe_base64(9)
      self.class.where(:access_token => tmp_token).blank? ? tmp_token : generate_access_token
    end

  self.primary_key = "access_token"
end
