require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has an email' do
    should validate_presence_of :email

  end

  it 'has many posts' do
    should have_many :posts
  end

  it 'has many comments' do
    should have_many :comments
  end

  it 'has many elements' do
    should have_many :elements
  end
end
