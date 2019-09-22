FactoryBot.define do

  factory :address do
    street { 'Rose street' }
    country { 'US' }
    city { 'New York' }
    zip_code { '12523-1235' }
  end

end