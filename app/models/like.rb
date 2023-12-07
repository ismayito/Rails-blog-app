class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  after_create :increment_likes_counter
  after_destroy :decrement_likes_counter

  private

  def increment_likes_counter
    post.increment!(:LikesCounter)
  end

  def decrement_likes_counter
    post.decrement!(:LikesCounter)
  end
end
