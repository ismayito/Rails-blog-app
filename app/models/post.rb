class Post < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  has_many :comments
  has_many :likes

  # method that returns the 5 most recent comments for a given comment
  scope :five_most_recent_posts_for_comment, lambda { |post_id|
                                               where(id: post_id).order(created_at: :desc).limit(5)
                                             }

  after_create :update_post_counter
  after_destroy :decrement_post_counter

  private

  def update_post_counter
    user.increment!(:PostsCounter)
  end

  def decrement_post_counter
    user.decrement!(:PostsCounter)
  end
end
