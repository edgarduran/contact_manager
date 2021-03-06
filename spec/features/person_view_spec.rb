require 'rails_helper'

describe 'the person view', type: :feature do

  let(:person) { Person.create(first_name: 'John', last_name: 'Doe') }

  before(:each) do
    person.phone_numbers.create(number: '7194345697')
    person.phone_numbers.create(number: '9703293622')
    visit person_path(person)
  end

  it 'shows the phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_content(phone.number)
    end
  end

  it 'has a link to add a new phone number' do
    expect(page).to have_link('Add phone number', href: new_phone_number_path(person_id: person.id))
  end

  it 'adds a new phone number' do
    page.click_link('Add phone number')
    page.fill_in('Number', with: '9704553434')
    page.click_button('Create Phone Number')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('970455343')
  end

  it 'has links to edit phone numbers' do
    person.phone_numbers.each do |phone|
      expect(page).to have_link('edit', href: edit_phone_number_path(phone))
    end
  end

  it 'edits a phone number' do
    phone = person.phone_numbers.first
    old_number = phone.number

    first(:link, 'edit').click
    page.fill_in('Number', with: '3034564544')
    page.click_button('Update Phone Number')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('3034564544')
    expect(page).to_not have_content(old_number)
  end

  it 'has links to delete each phone number' do
    person.phone_numbers.each do |phone|
      expect(page).to have_link('delete', href: phone_number_path(phone))
    end
  end

  describe 'email addresses' do
    before(:each) do
      person.email_addresses.create(address: 'jake@snake.com')
      person.email_addresses.create(address: 'don@yourmom.com')
      visit person_path(person)
    end
  end
  it 'shows the email addresses' do
    person.email_addresses.each do |address|
      expect(page).to have_selector('li', text: address.address)
    end
  end
  it 'has a link to add a new email' do
    expect(page).to have_link('Add email address', href: new_email_address_path(person_id: person.id))
  end
  it 'adds a new email address' do
    page.click_link('Add email address')
    page.fill_in('Address', with: 'you@me.com')
    page.click_button('Create Email address')
    expect(current_path).to eq(person_path(person))
    expect(page).to have_content('you@me.com')
  end

end
