# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
first_user = User.create!(name: 'Tom', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
bio: 'Teacher from Mexico.', post_counter: 0)
second_user = User.create!(name: 'Lilly', photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
bio: 'Teacher from Poland.', post_counter: 0)

first_post = Post.create!(author_id: first_user.id, title: 'Tom first', text: 'This is Tom first post', likes_counter: 0, comments_counter: 0)
second_post = Post.create!(author_id: second_user.id, title: 'Lily first', text: 'This is Lily first post', likes_counter: 0, comments_counter: 0)
third_post = Post.create!(author_id: first_user.id, title: 'Mr Tom second post', text: 'This is Tom second post', likes_counter: 0, comments_counter: 0)
fourth_post = Post.create!(author_id: second_user.id, title: 'Ms Lily second post', text: 'This is Lily second post', likes_counter: 0, comments_counter: 0)
fifth_post = Post.create!(author_id: first_user.id, title: 'Mr Tom third post', text: 'This is Tom third post', likes_counter: 0, comments_counter: 0)
sixth_post = Post.create!(author_id: second_user.id, title: 'Ms Lily third post', text: 'This is Lily third post', likes_counter: 0, comments_counter: 0)

first_comment = Comment.create!(user_id: first_user.id, post_id: first_post.id, text: 'Tom first comment!')
second_comment = Comment.create!(user_id: second_user.id, post_id: second_post.id, text: 'Lily second comment!')
