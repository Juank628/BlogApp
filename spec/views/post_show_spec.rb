require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before :each do
    @user1 = User.create(id: 1, name: 'Tom', photo: 'https://randomuser.me/api/portraits/men/1.jpg',
                         bio: 'Teacher from Mexico.', posts_counter: 0)
    @user2 = User.create(id: 2, name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                         bio: 'Teacher from Poland.', posts_counter: 0)

    @first_post = Post.create(id: 1, title: 'post 1', text: 'text 1', likes_counter: 3, comments_counter: 0,
                              author: @user1)
    Post.create(id: 2, title: 'post 2', text: 'text 2', likes_counter: 0, comments_counter: 0, author: @user1)
    Post.create(id: 3, title: 'post 3', text: 'text 3', likes_counter: 0, comments_counter: 0, author: @user1)
    Post.create(id: 4, title: 'post 4', text: 'text 4', likes_counter: 0, comments_counter: 0, author: @user1)

    Comment.create(post: @first_post, user: @user2, text: 'First comment')
    Comment.create(post: @first_post, user: @user1, text: 'Second comment')
    Comment.create(post: @first_post, user: @user2, text: 'Third comment')
    Comment.create(post: @first_post, user: @user1, text: 'Fourth comment')
    Comment.create(post: @first_post, user: @user2, text: 'Fifth comment')
    Comment.create(post: @first_post, user: @user1, text: 'Sixth comment')
  end

  user_post_path = '/users/1/posts/1'

  scenario "show post's title" do
    visit user_post_path
    expect(page).to have_selector('h1', text: 'post 1')
  end

  scenario "show post's author" do
    visit user_post_path
    expect(page).to have_selector('h1', text: 'Tom')
  end

  scenario 'Show the number of comments for a post' do
    visit user_post_path
    expect(page).to have_content('Comments: 6')
  end

  scenario 'Show the number of likes for a post' do
    visit user_post_path
    expect(page).to have_content('Likes: 3')
  end

  scenario 'Show the content of a post' do
    visit user_post_path
    expect(page).to have_selector('p', text: 'text 1')
  end

  scenario 'Show the username of all commenters' do
    visit user_post_path
    expect(page).to have_selector('.posts_show_commentator', text: 'Tom', count: 3)
    expect(page).to have_selector('.posts_show_commentator', text: 'Lilly', count: 3)
  end

  scenario 'Show the comment of all commenter' do
    visit user_post_path
    expect(page).to have_selector('.comment-identifier', text: 'Tom' && 'Second comment')
    expect(page).to have_selector('.comment-identifier', text: 'Tom' && 'Fourth comment')
    expect(page).to have_selector('.comment-identifier', text: 'Tom' && 'Sixth comment')

    expect(page).to have_selector('.comment-identifier', text: 'Lilly' && 'Third comment')
    expect(page).to have_selector('.comment-identifier', text: 'Lilly' && 'Fifth comment')
  end
end
