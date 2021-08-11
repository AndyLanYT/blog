require 'rails_helper'

RSpec.describe ElementsController, type: :controller do
  let(:current_user) do
    User.create!(
      id: 153,
      email: 'email@example.com',
      password: 'password'
    )
  end
  let(:current_post) do
    Post.create!(
      id: 239,
      title: 'Title',
      description: 'Description',
      user: current_user
    )
  end
  let(:valid_element_params) do
    {
      element_type: 'paragraph'
    }
  end

  describe 'POST #create' do
    it 'redirects admin to another page response' do
      current_user.admin = true
      login current_user

      post :create, params: { post_id: current_post.id, element: valid_element_params }
      expect(response.code).to eq('302')
    end

    it 'redirects user to another page response' do
      current_user.user_role = true
      login current_user

      post :create, params: { post_id: current_post.id, element: valid_element_params }
      expect(response.code).to eq('302')
    end

    it 'redirects guest to another page response' do
      post :create, params: { post_id: current_post.id, element: valid_element_params }
      expect(response).not_to be_successful
    end
  end

  describe 'PUT #update' do
    let(:current_element) do
      current_post.elements.build(valid_element_params.merge({ user: current_user, post: current_post }))
    end

    before do
      current_element.save
    end

    it 'redirects admin to another page response' do
      current_user.admin = true
      login current_user

      put :update,
          params: { id: current_element.id, user_id: current_user.id, post_id: current_post.id,
                    element: valid_element_params }
      expect(response.code).to eq('302')
    end

    it 'redirects admin to another page response' do
      current_user.user_role = true
      login current_user

      put :update,
          params: { id: current_element.id, user_id: current_user.id, post_id: current_post.id,
                    element: valid_element_params }
      expect(response.code).to eq('302')
    end

    it 'redirects admin to another page response' do
      put :update,
          params: { id: current_element.id, user_id: current_user.id, post_id: current_post.id,
                    element: valid_element_params }
      expect(response.code).to eq('302')
    end
  end

  describe 'DELETE #destroy' do
    let(:current_element) do
      current_post.elements.build(valid_element_params.merge({ user: current_user, post: current_post }))
    end

    before do
      current_element.save
    end

    it 'redirects admin to another page response' do
      current_user.admin = true
      login current_user

      delete :destroy, params: { id: current_element.id, post_id: current_post.id, element: valid_element_params }
      expect(response.code).to eq('302')
    end

    it 'redirects user to another page response' do
      current_user.user_role = true
      login current_user

      delete :destroy, params: { id: current_element.id, post_id: current_post.id, element: valid_element_params }
      expect(response.code).to eq('302')
    end

    it 'redirects guest to another page response' do
      delete :destroy, params: { id: current_element.id, post_id: current_post.id, element: valid_element_params }
      expect(response).not_to be_successful
    end
  end
end
