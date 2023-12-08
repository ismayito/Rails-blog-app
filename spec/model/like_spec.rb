require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#increment_likes_counter' do
    it 'increments the post\'s LikesCounter' do
      user = User.create(Name: 'Test User', Photo: 'https://example.com', Bio: 'Test Bio', PostsCounter: 0)
      post = Post.create(author_id: user.id, Title: 'Test Post', Text: 'This is a test post', CommentsCounter: 0,
                         LikesCounter: 0)

      # Ensure that the post is created successfully
      expect(post).to be_valid

      expect { Like.create(user: user, post: post) }.to change { post.reload.LikesCounter }.by(1)
    end
  end

  describe '#decrement_likes_counter' do
    it 'decrements the post\'s LikesCounter' do
      user = User.create(Name: 'Test User', Photo: 'https://example.com', Bio: 'Test Bio', PostsCounter: 0)
      post = Post.create(author_id: user.id, Title: 'Test Post', Text: 'This is a test post', CommentsCounter: 0,
                         LikesCounter: 0)

      # Ensure that the post is created successfully
      expect(post).to be_valid

      like = Like.create(user: user, post: post)

      expect { like.destroy }.to change { post.reload.LikesCounter }.by(-1)
    end
  end
end
