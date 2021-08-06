require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'ensures title presence' do
    post = described_class.new(description: 'Description')
    expect(post).to_not be_valid

    post.title = 'Title'
    expect(post).to be_valid
  end
  
  it 'ensures description presence' do
    post = described_class.new(title: 'Title')
    expect(post).to_not be_valid

    post.description = 'Description'
    expect(post).to be_valid
  end

  it 'has a title length equal at least 2' do
    post = described_class.new(title: '', description: 'Just a description')
    expect(post).not_to be_valid

    post.title = 'TT'
    expect(post).to be_valid
  end
  
  it 'has a description length between 5 and 100' do
    post = described_class.new(title: 'Just a title', description: '')
    expect(post).not_to be_valid

    post.description = 'Text!'
    expect(post).to be_valid

    post.description = '*' * 100
    expect(post).to be_valid

    post.description = '*' * 101
    expect(post).not_to be_valid
  end

  it 'is saved successfully' do
    post = described_class.new(title: 'Title', description: 'Description').save
    expect(post).to eq(true)
  end
end
