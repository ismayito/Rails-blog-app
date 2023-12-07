class Like < ApplicationRecord
    belongs_to :user
    belongs_to :post
    after_create :increment_likes_counter
    after_destroy :decrement_likes_counter


    private
    def increment_likes_counter
        self.post.increment!(:LikesCounter)
    end

    def decrement_likes_counter
       self.post.decrement!(:LikesCounter)
    end

    
end
