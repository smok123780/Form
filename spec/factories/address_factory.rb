FactoryBot.define do

  factory :address do
    street { 'Jerozolimskich' }
    country { 'PL' }
    city { 'Warszawa' }
    zip_code { '00-001' }
  end

end