require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:address) do
    EmailAddress.new(address: 'ron@yourmom.com', person_id: 1 )
  end
  it 'is valid with email address' do
    expect(address).to be_valid
  end
  it 'is invalid if email is blank' do
    address.address = nil
    expect(address).to_not be_valid
  end

end
