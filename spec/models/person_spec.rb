require 'rails_helper'

RSpec.describe Person, :type => :model do
  let(:person) do
    Person.new(first_name: 'Sandy', last_name: 'Summers')
  end
  it 'is invalid without a first name' do
    person.first_name = nil
    expect(person).not_to be_valid
  end
  it 'is invalid without a last name' do
    person.last_name = nil
    expect(person).not_to be_valid
  end
  it 'is capable of having phone numbers' do
    expect(person.phone_numbers).to eq([])
  end
  it 'is capable of having email addresses' do
    expect(person.email_addresses).to eq([])
  end
end
