class User < ApplicationRecord
  include ActiveModel::Validations

  has_one :address, :dependent =>  :delete
  has_one :company, dependent: :delete
  accepts_nested_attributes_for :company, reject_if: :all_blank
  accepts_nested_attributes_for :address

  validates :first_name, length: { maximum: 100 }, presence: true
  validates :last_name, length: { maximum: 100 }, presence: true
  validates_presence_of :email_address
  validates_format_of :email_address, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :phone_number, telephone_number: { country: proc{|record| record.address.country} }, allow_blank: true
  validates_with DateOfBirthValidator
end
