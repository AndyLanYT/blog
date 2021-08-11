require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:current_user) do
    User.create!(
      id: 153,
      email: 'email@example.com',
      password: 'password'
    )
  end
  let(:valid_post_params) do
    {
      title: 'Title',
      description: 'Description'
    }
  end

  describe 'GET #show' do
    let(:current_post) { Post.new(valid_post_params.merge({ user_id: current_user.id })) }

    before do
      current_post.save
    end

    it 'works when the admin reads' do
      current_user.admin = true
      login current_user

      get :show, params: { id: current_post.id, user: current_user }
      expect(response).to be_successful
    end

    it 'works when the user reads' do
      current_user.user_role = true
      login current_user

      get :show, params: { id: current_post.id, user: current_user }
      expect(response).to be_successful
    end

    # it 'works when the guest reads' do
    #     get :show, params: { id: current_post.id, user: current_user }
    #     expect(response).to be_successful
    # end
  end

  describe 'POST #create' do
    it 'redirects admin to another page response' do
      current_user.admin = true
      login current_user

      post :create, params: { post: valid_post_params }
      expect(response.code).to eq('302')
    end

    it 'redirects user to another page response' do
      current_user.user_role = true
      login current_user

      post :create, params: { post: valid_post_params }
      expect(response.code).to eq('302')
    end

    it 'redirects guest to another page response' do
      post :create, params: { post: valid_post_params }
      expect(response).not_to be_successful
    end
  end

  describe 'PUT #update' do
    let(:current_post) { Post.new(valid_post_params.merge({ user_id: current_user.id })) }

    before do
      current_post.save
    end

    it 'redirects admin to another page response' do
      current_user.admin = true
      login current_user

      put :update, params: { id: current_post.id, post: valid_post_params }
      expect(response.code).to eq('302')
    end

    it 'redirects user to another page response' do
      current_user.user_role = true
      login current_user

      put :update, params: { id: current_post.id, post: valid_post_params }
      expect(response.code).to eq('302')
    end

    it 'redirects guest to another page response' do
      put :update, params: { id: current_post.id, post: valid_post_params }
      expect(response).not_to be_successful
    end
  end

  describe 'DELETE #destroy' do
    let(:current_post) { Post.new(valid_post_params.merge({ user_id: current_user.id })) }

    before do
      current_post.save
    end

    it 'redirects admin to another page response' do
      current_user.admin = true
      login current_user

      delete :destroy, params: { id: current_post.id, post: valid_post_params }
      expect(response.code).to eq('302')
    end

    it 'redirects user to another page response' do
      current_user.user_role = true
      login current_user

      delete :destroy, params: { id: current_post.id, post: valid_post_params }
      expect(response.code).to eq('302')
    end

    it 'redirects guest to another page response' do
      delete :destroy, params: { id: current_post.id, post: valid_post_params }
      expect(response).not_to be_successful
    end
  end
end
