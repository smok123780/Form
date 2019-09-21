class Company < ApplicationRecord
  belongs_to :user, optional: true
  has_one :address, dependent: :delete
  accepts_nested_attributes_for :address
  validates :name, length: { maximum: 200 }
end
