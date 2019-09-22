require "rails_helper"
RSpec.describe Address, type: :model do

  before(:each) do
    @address = create(:address)
  end

  context 'for user' do
    before(:each) do
      user = FactoryBot.create(:user).address = @address
    end
    # Street tests
    it 'should pass validation when street name is added' do
      @address.street = 'Jerozolimskie'
      expect { @address.save! }.to_not raise_error
    end

    it 'should fails validation when street name is nil' do
      @address.street = nil
      expect { @address.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    #City test
    it 'should pass validation when city name is added' do
      @address.city = 'Radom'
      expect { @address.save! }.to_not raise_error
    end

    it 'should fails validation when city name is nil' do
      @address.city = nil
      expect { @address.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    #zip_code tests
    it 'should pass validation when zip_code is added' do
      @address.zip_code = '02-122'
      expect { @address.save! }.to_not raise_error
    end

    it 'should fails validation when zip_code is wrong' do
      @address.zip_code = '0000-111111'
      expect { @address.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should fails validation when zip_code is nil' do
      @address.zip_code = nil
      expect { @address.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    #Country
    it 'should pass validation when Country is added' do
      @address.country = 'PL'
      expect { @address.save! }.to_not raise_error
    end

    it 'should fails validation when Country is in wrong format' do
      @address.country = 'Polska'
      expect { @address.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should fails validation when Country is nil' do
      @address.country = nil
      expect { @address.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'for company' do
    before(:each) do
      company = FactoryBot.create(:company).address = @address
    end
    # Street tests
    it 'should pass validation when street name is added' do
      @address.street = 'Jerozolimskie'
      expect { @address.save! }.to_not raise_error
    end

    it 'should pass validation when street name is nil' do
      @address.street = nil
      expect { @address.save! }.to_not raise_error
    end

    #City test
    it 'should pass validation when city name is added' do
      @address.city = 'Radom'
      expect { @address.save! }.to_not raise_error
    end

    it 'should pass validation when city name is nil' do
      @address.city = nil
      expect { @address.save! }.to_not raise_error
    end

    #zip_code tests
    it 'should pass validation when zip_code is added' do
      @address.zip_code = '02-122'
      expect { @address.save! }.to_not raise_error
    end

    it 'should fails validation when zip_code is wrong' do
      @address.zip_code = '0000-111111'
      expect { @address.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'should pass validation when zip_code is nil' do
      @address.zip_code = nil
      expect { @address.save! }.to_not raise_error
    end

    #Country
    it 'should pass validation when Country is added' do
      @address.country = 'PL'
      expect { @address.save! }.to_not raise_error
    end

    it 'should pass validation when Country is nil' do
      @address.country = nil
      expect { @address.save! }.to_not raise_error
    end

    it 'should fails validation when Country is in wrong format' do
      @address.country = 'Polska'
      expect { @address.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end