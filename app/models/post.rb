class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :user_posts_count
  after_destroy :user_posts_count

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end

private

# A method that updates the posts count for a user.
def user_posts_count
  author.update(posts_counter: author.posts.count)
end
