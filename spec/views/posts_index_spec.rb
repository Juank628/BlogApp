require 'rails_helper'

RSpec.describe 'Posts Index', type: :feature do
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

  user_posts_path = '/users/1/posts'

  scenario 'Shows the users profile picture' do
    visit user_posts_path
    expect(page).to have_selector('img[src="https://randomuser.me/api/portraits/men/1.jpg"]')
  end

  scenario 'Shows the users username' do
    visit user_posts_path
    expect(page).to have_content('Tom')
  end

  scenario 'Shows the number of posts the user has written' do
    visit user_posts_path
    expect(page).to have_content('Number of posts: 4')
  end

  scenario "Shows a post's title" do
    visit user_posts_path
    expect(page).to have_selector('.title-identifier')
  end

  scenario 'Show the content of a post' do
    visit user_posts_path
    expect(page).to have_content('text 1')
  end

  scenario 'Show some of the comments for each post' do
    visit user_posts_path
    expect(page).to have_selector('.comment-identifier')
  end

  scenario 'Show the number of comments for a post' do
    visit user_posts_path
    expect(page).to have_content('Comments: 6')
  end

  scenario 'Show number of likes for a post' do
    visit user_posts_path
    expect(page).to have_content('Likes: 3')
  end

  scenario 'Show pagination if there are more posts that fit on the view' do
    visit user_posts_path
    expect(page).to have_content('Pagination') if page.all('.posts_index_post').count > 3
  end

  scenario "When a post is clicked, it redirects the user to that post's show page" do
    visit user_posts_path
    click_link(href: '/users/1/posts/1')
    expect(page).to have_current_path('/users/1/posts/1')
  end
end
