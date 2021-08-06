require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:current_user) do
    User.create!(
      id: 1,
      email: 'email@example.com',
      password: 'password'
    )
  end

  it 'has a title' do
    post = described_class.new(title: nil, description: 'Description', user: current_user)
    expect(post).to_not be_valid

    post.title = 'Title'
    expect(post).to be_valid
  end
  
  it 'has a description' do
    post = described_class.new(title: 'Title', description: nil, user: current_user)
    expect(post).to_not be_valid

    post.description = 'Description'
    expect(post).to be_valid
  end

  it 'has a title length equal at least 2' do
    post = described_class.new(title: 'T', description: 'Description', user: current_user)
    expect(post).not_to be_valid

    post.title = 'TT'
    expect(post).to be_valid
  end
  
  it 'has a description length between 5 and 100' do
    post = described_class.new(title: 'Title', description: 'Desc', user: current_user)
    expect(post).not_to be_valid

    post.description = '*' * 5
    expect(post).to be_valid

    post.description = '*' * 100
    expect(post).to be_valid

    post.description = '*' * 101
    expect(post).not_to be_valid
  end

  it 'should belongs to user' do
    post = described_class.new(title: 'Title', description: 'Description', user: nil)
    expect(post).to_not be_valid

    post.user = current_user
    expect(post).to be_valid
  end

  it 'is saved successfully' do
    post = described_class.new(title: 'Title', description: 'Description', user: current_user).save
    expect(post).to eq(true)
  end
end
