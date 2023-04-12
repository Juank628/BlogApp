require 'rails_helper'

RSpec.describe Like, type: :model do
  subject do
    first_user = User.new(name: 'Tom', photo: 'soon...', bio: 'Teacher from Mexico.', posts_counter: 0)
    Post.create(title: 'Hello', text: 'Mi first post', likes_counter: 5, comments_counter: 0, author: first_user)
  end

  it 'likes counter should be 5' do
    expect(subject.likes_counter).to eq(5)
  end

  it 'likes_counter should be equal to 5' do
    Like.create(post: subject)
    Like.create(post: subject)
    Like.create(post: subject)
    Like.create(post: subject)
    Like.create(post: subject)
    expect(subject.likes_counter).to eql 5
  end
end
