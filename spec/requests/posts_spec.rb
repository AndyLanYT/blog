require 'rails_helper'

RSpec.describe "Posts", type: :request do
  let(:valid_attributes) do
    {
      'title' => 'Title',
      'description' => 'Description'
    }
  end

  let(:invalid_attributes) do
    {
      'title' => '',
      'description' => ''
    }
  end

  describe "GET /index" do
    it 'renders a successful response' do
      post = Post.create(title: 'Title', description: 'Description')
      get posts_path
      expect(response).to be_successful
    end
  end

  # describe "GET /show" do
  #   it 'renders a successful response' do
  #     post = Post.create(valid_attributes)
  #     get post_url(post)
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /new" do
  #   it 'renders a successful response' do
  #     get new_post_url
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /edit" do
  #   it 'renders a successful response' do
  #     post = Post.create(valid_attributes)
  #     get edit_post_url(post)
  #     expect(response).to be_successful
  #   end
  # end
end
