class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_create :update_post_counter
  after_destroy :decrement_post_counter

  # method that returns the 5 most recent comments for a given comment
  def five_most_recent_posts_for_comment
    comments.order('created_at Desc').limit(5)
  end

  private

  def update_post_counter
    user.increment!(:PostsCounter)
  end

  def decrement_post_counter
    user.decrement!(:PostsCounter)
  end
end
