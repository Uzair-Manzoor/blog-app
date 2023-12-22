require 'rails_helper'

RSpec.feature 'User Index Page' do
  let!(:user1) { User.create(name: 'Uzair', photo: 'https://avatars.githubusercontent.com/u/99558868?v=4') }
  let!(:user2) { User.create(name: 'Ismail', photo: 'https://avatars.githubusercontent.com/u/47735113?v=4') }
  let!(:post1) { Post.create(author: user1, title: 'Post 01') }
  let!(:post2) { Post.create(author: user2, title: 'Post 02') }

  scenario 'Displays usernames' do
    visit users_path
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
  end

  scenario 'Displays profile pictures' do
    visit users_path
    expect(page).to have_css("img[src='#{user1.photo}']")
    expect(page).to have_css("img[src='#{user2.photo}']")
  end

  scenario 'Displays post counts' do
    visit users_path
    expect(page).to have_content("Number of posts: #{user1.post_counter}")
    expect(page).to have_content("Number of posts: #{user2.post_counter}")
  end

  scenario 'Redirects to user show page when clicked' do
    visit users_path
    click_link user1.name
    sleep(1)
    expect(current_path).to eq(user_path(user1))
  end
end
