require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validation tests" do
    it 'ensures title presence' do
      post = Post.new(description: 'Description').save
      expect(post).to eq(false)
    end

    it 'has a title length is equal or greater than 2' do
      post = Post.new(title: '', description: 'Just a description')
      expect(post).to_not be_valid
      
      post.title = 'TT'
      expect(post).to be_valid
    end

    it 'ensures description presence' do
      post = Post.new(title: 'Title').save
      expect(post).to eq(false)
    end

    it 'has a description length is between 5 and 100' do
      post = Post.new(title: 'Just a title', description: '')
      expect(post).to_not be_valid
      
      post.description = 'Text!'
      expect(post).to be_valid

      post.description = 'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij'
      expect(post).to be_valid

      post.description = 'abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghija'
      expect(post).to_not be_valid
    end

    it 'should be saved successfully' do
      post = Post.new(title: 'Title', description: 'Description').save
      expect(post).to eq(true)
    end
  end
end
