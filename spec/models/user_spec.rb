require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has an email' do
    expect(subject).to validate_presence_of :email
  end

  it 'has many posts' do
    expect(subject).to have_many :posts
  end

  it 'has many comments' do
    expect(subject).to have_many :comments
  end

  it 'has many elements' do
    expect(subject).to have_many :elements
  end
end
