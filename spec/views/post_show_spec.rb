require 'rails_helper'

RSpec.describe 'User show', type: :feature do
  user_post_path = "/users/1/posts/1"

  scenario "show post's title" do
    visit user_post_path
    expect(page).to have_selector('h1', text: 'Hello')
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
    expect(page).to have_selector('p', text: 'This is my first post')
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
