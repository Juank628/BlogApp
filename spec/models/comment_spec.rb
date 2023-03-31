require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    first_user = User.new(name: 'Tom', photo: 'soon...', bio: 'Teacher from Mexico.', posts_counter: 0)
    Post.create(title: 'Hello', text: 'Mi first post', likes_counter: 0, comments_counter: 2, author: first_user)
  end

  it 'comments counter should be 2' do
    expect(subject.comments_counter).to eq(2)
  end

  context 'comments_counter should increment by 1 each time comment created' do
    it 'Comments_counter should be equal to 2' do
      Comment.create(post: subject)
      Comment.create(post: subject)
      expect(subject.comments_counter).to eql 2
    end
  end
end
