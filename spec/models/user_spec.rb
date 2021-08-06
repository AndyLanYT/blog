require 'rails_helper'

RSpec.describe User, type: :model do
  it 'ensures email presence' do
    user = described_class.new
    expect(user).to_not be_vaild

    user.email = 'email@example.com'
    expect(user).to be_vaild
  end

  # it 'has a password length is between 6 and 20' do
  #   user = User.new(username: 'username', email: 'email@example.com')
  #   expect(user).to_not be_valid

  #   user.password = '123456'
  #   expect(user).to be_valid

  #   user.password = '12345678900987654321'
  #   expect(user).to be_valid

  #   user.password = '123456789009876543211'
  #   expect(user).to_not be_valid
  # end

  # it {should validates_uniqueness_of(:username)}

  # it {should validates_uniqueness_of(:email)}
  # end
end
