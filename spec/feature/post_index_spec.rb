require 'rails_helper'

RSpec.feature 'User Post Index Page' do
  let!(:user) { User.create(name: 'Uzair', photo: 'https://avatars.githubusercontent.com/u/99558868?v=4') }
  let!(:post) do
    Post.create(author_id: user.id, title: 'Test Post', text: 'Hello world!')
  end
  let!(:comment1) { Comment.create(user:, post:, text: 'Hello Microverse!') }
  let!(:comment2) { Comment.create(user:, post:, text: 'Rails are getting out of control!') }

  scenario 'Displays username, profile picture, number of posts and total likes' do
    visit user_posts_path(user)
    expect(page).to have_css("img[src='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.count}")
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  scenario 'Displays post title and some of the post body' do
    visit user_posts_path(user)
    expect(page).to have_content(post.title)
    expect(page).to have_content('Hello world!')
  end

  scenario 'Displays the first comments on a post and total comments' do
    visit user_posts_path(user)
    expect(page).to have_content(comment2.text)
    expect(page).to have_content("Comments: #{post.comments_counter}")
  end

  scenario 'Redirects to post show page when clicked' do
    visit user_posts_path(user)
    click_link post.title
    sleep(1)
    expect(current_path).to eq(user_post_path(user, post))
  end
end