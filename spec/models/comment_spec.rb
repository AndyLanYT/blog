require 'rails_helper'

RSpec.describe Comment, type: :model do
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

  it 'has a body' do
    comment = described_class.new(body: nil, user: current_user, post: current_post)
    expect(comment).to_not be_valid

    comment.body = 'Text'
    expect(comment).to be_valid
  end
end
