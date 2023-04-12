require 'rails_helper'

RSpec.describe 'Users Index', type: :feature do
  before :each do
    @user1 = User.create(name: 'Tom', photo: 'https://randomuser.me/api/portraits/men/1.jpg', bio: 'Teacher from Mexico.', posts_counter: 4)
    @user1 = User.create(name: 'Lilly', photo: 'https://randomuser.me/api/portraits/women/1.jpg', bio: 'Teacher from Poland.', posts_counter: 0)


    Post.create(id: 1, title: 'post 1', text: 'text 1', likes_counters: 0, comments_counter: 0, user_id: @user1.id)
    Post.create(id: 2, title: 'post 2', text: 'text 2', likes_counters: 0, comments_counter: 0, user_id: @user1.id)
    Post.create(id: 3, title: 'post 3', text: 'text 3', likes_counters: 0, comments_counter: 0, user_id: @user1.id)
    Post.create(id: 4, title: 'post 4', text: 'text 4', likes_counters: 0, comments_counter: 0, user_id: @user1.id)
  end
  root_path = '/users'

  scenario 'Shows the name of every user' do
    visit root_path
    expect(page).to have_content('Tom')
    expect(page).to have_content('Lilly')
  end

  scenario 'shows two user images' do
    visit root_path
    expect(page).to have_selector('img', count: 2)
    expect(page).to have_selector('img[src="https://randomuser.me/api/portraits/men/1.jpg"]')
  end

  scenario 'shows correct number of posts for each user' do
    visit root_path
    expect(page).to have_selector('span', text: '4')
    expect(page).to have_selector('span', text: '0')
  end

  scenario 'clicks on a use redirect to user profile' do
    visit root_path
    click_link(href: '/users/1')
    expect(page).to have_current_path('/users/1')
  end
end
