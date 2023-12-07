class User  < ApplicationRecord
    scope :three_most_recent_posts_for_user, ->(user_id) {where(id:user_id).order(created_at: :desc).limit(3)}
    has_many :posts
    has_many :likes
    has_many :comments
end
