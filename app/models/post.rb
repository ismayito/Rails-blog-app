class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  validates :Title, presence: true
  validates :LikesCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :CommentsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_create :update_post_counter
  after_destroy :decrement_post_counter

  # method that returns the 5 most recent comments for a given comment
  def five_most_recent_posts_for_comment
    comments.order('created_at Desc').limit(5)
  end

  private

  def update_post_counter
    author.increment!(:PostsCounter)
  end

  def decrement_post_counter
    author.decrement!(:PostsCounter)
  end
end
