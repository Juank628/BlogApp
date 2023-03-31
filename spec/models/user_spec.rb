require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Juan', photo: 'soon...', bio: 'my bio', posts_counter: 6) }

  before { subject.save }

  it 'name should be present' do
    expect(subject.name).to eq('Juan')
  end

  it 'user should be valid' do
    expect(subject).to be_valid
  end

  it 'user should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should not be nil' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should not be negative' do
    subject.posts_counter = -7
    expect(subject).to_not be_valid
  end

  it 'recent_posts method should return 3 last posts' do
    user = User.create(name: 'Juan', photo: 'soon...', bio: 'Teacher from Poland.', posts_counter: 0)
    Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                likes_counter: 0)

    expect(user.recent_posts.length).to eql 3
  end
end
