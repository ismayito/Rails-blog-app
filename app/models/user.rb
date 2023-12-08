class User < ApplicationRecord
  validates :Name, presence: true
  validates :PostsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def recent_post
    posts.order('created_at Desc').limit(3)
  end
end
