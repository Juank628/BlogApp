require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    first_user = User.new(name: 'Tom', photo: 'soon...', bio: 'Teacher from Mexico.', posts_counter: 0)
    Post.new(author: first_user, title: 'Hello', text: 'This is my first post', comments_counter: 3, likes_counter: 10)
  end

  it 'title should be present' do
    expect(subject.title).to eq('Hello')
  end

  it 'post should be valid' do
    expect(subject).to be_valid
  end

  it 'itile should not be nil' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'post should be invalid when title length > 250 characters' do
    subject.title = '
    *******************************************
    *******************************************
    *******************************************
    *******************************************
    *******************************************
    *******************************************
    '
    expect(subject).to_not be_valid
  end

  it 'post should be invalid if likes_counter < 0' do
    subject.likes_counter = -10
    expect(subject).to_not be_valid
  end

  it 'recent_comments should return 5 elemets' do
    user = User.create(name: 'Juan', photo: 'soon...', bio: 'Teacher from Poland.', posts_counter: 0)
    Comment.create(user: user, post: subject)
    Comment.create(user: user, post: subject)
    Comment.create(user: user, post: subject)
    Comment.create(user: user, post: subject)
    Comment.create(user: user, post: subject)
    Comment.create(user: user, post: subject)
    Comment.create(user: user, post: subject)

    expect(subject.recent_comments.length).to eql 5
  end
end
