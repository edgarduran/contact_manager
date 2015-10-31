require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:phone_number) do
    PhoneNumber.new(number: '7023452323', person_id: 1)
  end
  it 'is valid with phone number' do
    expect(phone_number).to be_valid
  end
  it 'is invlaid if number is blank' do
    phone_number.number = nil
    expect(phone_number).to_not be_valid
  end
  it 'must have a reference to a person' do
    phone_number.person_id = nil
    expect(phone_number).not_to be_valid
  end
end
