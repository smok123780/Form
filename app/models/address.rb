class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :company, optional: true

  validates_presence_of :street, :zip_code, :city, :country, if: :user?
  validates :country, inclusion: { in:ISO3166::Country.all.map(&:alpha2) }, allow_blank: true
  validates :zip_code, zipcode: { country_code_attribute: :country }, allow_blank: true

  def user?
    user_id.present?
  end
end
