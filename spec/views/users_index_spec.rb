require 'rails_helper'

RSpec.describe 'Users Index', type: :feature do
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
