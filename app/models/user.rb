class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_validation :set_defaults
  validates :Name, presence: true
  validates :PostsCounter, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  def recent_post
    posts.order('created_at Desc').limit(3)
  end

  private

  def set_defaults
    self.PostsCounter ||= 0
  end
end
