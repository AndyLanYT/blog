require 'rails_helper'

RSpec.describe Element, type: :model do
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

  it 'has an element type paragraph or photo' do
    element = described_class.new(element_type: nil, user: current_user, post: current_post)
    expect(element).not_to be_valid

    element.element_type = 'paragraph'
    expect(element).to be_valid

    element.element_type = 'image'
    expect(element).to be_valid

    element.element_type = 'video'
    expect(element).not_to be_valid
  end
end
