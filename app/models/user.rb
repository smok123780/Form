class User < ApplicationRecord
  has_one :address, :dependent =>  :delete
  has_one :company, dependent: :delete
  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :address

  validates :first_name, length: { maximum: 100 }, presence: true
  validates :last_name, length: { maximum: 100 }, presence: true
  validates_presence_of :email_address
  validates_format_of :email_address, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/


end
