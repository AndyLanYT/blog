require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has an email' do
    expect(subject).to validate_presence_of :email
    # user = described_class.new(email: nil)
    # expect(user).to_not be_vaild

    # user.email = 'email@example.com'
    # expect(user).to be_vaild
  end

  it 'has many posts' do
    expect(subject).to have_many :posts
  end
end
