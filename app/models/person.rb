class Person < ActiveRecord::Base
  has_many :email_addresses
  has_many :phone_numbers
  validates :first_name, :last_name, presence: true
end
