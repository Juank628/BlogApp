require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  before :each do
    @user1 = User.create(id: 1, name: 'Tom', photo: 'https://randomuser.me/api/portraits/men/1.jpg',
                         bio: 'Teacher from Mexico.', posts_counter: 0)

    Post.create(id: 1, title: 'post 1', text: 'text 1', likes_counter: 0, comments_counter: 0, author: @user1)
    Post.create(id: 2, title: 'post 2', text: 'text 2', likes_counter: 0, comments_counter: 0, author: @user1)
    Post.create(id: 3, title: 'post 3', text: 'text 3', likes_counter: 0, comments_counter: 0, author: @user1)
    Post.create(id: 4, title: 'post 4', text: 'text 4', likes_counter: 0, comments_counter: 0, author: @user1)
  end

  user_path = '/users/1'

  scenario 'show user picture' do
    visit user_path
    expect(page).to have_selector('img[src="https://randomuser.me/api/portraits/men/1.jpg"]')
  end

  scenario 'show username' do
    visit user_path
    expect(page).to have_content('Tom')
  end

  scenario 'show number of posts' do
    visit user_path
    expect(page).to have_content('4')
  end

  scenario 'show user bio' do
    visit user_path
    expect(page).to have_content('Teacher from Mexico.')
  end

  scenario 'show last 3 user posts' do
    visit user_path
    expect(page).to have_selector('.users_show_post', count: 3)
  end

  scenario 'show view all posts button' do
    visit user_path
    expect(page).to have_selector('a', text: 'See all posts')
  end

  scenario 'clicks on users post redirect to post show page' do
    visit user_path
    click_link(href: '/users/1/posts/2')
    expect(page).to have_current_path('/users/1/posts/2')
  end

  scenario 'clicks on sell all posts redirect to posts index page' do
    visit user_path
    click_link(href: '/users/1/posts')
    expect(page).to have_current_path('/users/1/posts')
  end
end
