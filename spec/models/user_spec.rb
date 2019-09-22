require "rails_helper"
RSpec.describe User, type: :model do

  before(:each) do
    @user = create(:user)
  end

  # Firts_name test
  it 'should pass validation when first name is added' do
    @user.first_name = "Andrzej"
    expect { @user.save }.to_not raise_error
  end

  it 'should fail validation when first name is empty' do
    @user.first_name = nil
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it 'should fail validation when first name is longer than 100 characters' do
    @user.first_name = 'a' * 101
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it 'should pass validation when first name is shorter than 100 characters' do
    @user.first_name = 'a' * 100
    expect { @user.save! }.to_not raise_error
  end

  # Last_name tests
  it 'should pass validation when last name is added' do
    @user.last_name = "Kowalski"
    expect { @user.save }.to_not raise_error
  end

  it 'should fail validation when last name is empty' do
    @user.first_name = nil
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it 'should fail validation when last name is longer than 100 characters' do
    @user.first_name = 'a' * 101
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it 'should pass validation when last name is shorter than 100 characters' do
    @user.first_name = 'a' * 100
    expect { @user.save! }.to_not raise_error
  end

# Email_address tests
  it 'should fail validation when email is empty' do
    @user.email_address = nil
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it 'should fail validation when email is wrongly written' do
    @user.email_address = 'abc@gmailcom'
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it 'should pass validation when email is wrongly written' do
    @user.email_address = 'abc@gmailcom'
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

# Date_of_Birth tests
  it 'should pass validation when date_of_birth is empty' do
    @user.date_of_birth = nil
    expect { @user.save! }.to_not raise_error
  end

  it 'should pass validation when date_of_birth is in the past' do
    @user.date_of_birth = Date.new(2000, 1, 1, 1)
    expect { @user.save! }.to_not raise_error
  end

  it 'should fail validation when date_of_birth is in the future' do
    @user.date_of_birth = Date.tomorrow
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it 'should fail validation when date_of_birth is in the wrong format' do
    @user.date_of_birth = 'abc'
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

  #phone_number test
  it 'should fail validation when phone number is in the wrong format' do
    @user.phone_number = 'abc'
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

  it 'should pass validation when phone number is in the correct format' do
    @user.phone_number = '+48-444-333-222'
    expect { @user.save! }.to_not raise_error
  end

  it 'should fail validation when phone number is in the wrong format' do
    @user.phone_number = '1-1-1-1-1-12-2-2'
    expect { @user.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

end