require "rails_helper"
RSpec.describe Company, type: :model do

  before(:each) do
    @company = create(:company)
  end

  it 'should pass validation when name is added' do
    @company.name = "Microsoft"
    expect { @company.save! }.to_not raise_error
  end

  it 'should pass validation when name is nil' do
    @company.name = nil
    expect { @company.save! }.to_not raise_error
  end

  it 'should fail validation when name is longer than 200 characters' do
    @company.name = 'a' * 201
    expect { @company.save! }.to raise_error( ActiveRecord::RecordInvalid )
  end

end