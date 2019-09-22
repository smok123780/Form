FactoryBot.define do

  factory :user do
    first_name { 'Jon' }
    last_name { 'Snow' }
    email_address { 'joe@gmail.com' }
    date_of_birth { Date.new(1995, 10, 10, 10) }
    phone_number { '+48-666-999-766' }
  end

end