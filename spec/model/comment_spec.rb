require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_comments_counter' do
    it 'increments the post\'s CommentsCounter' do
      user = User.create(Name: 'Test User', Photo: 'https://example.com', Bio: 'Test Bio', PostsCounter: 0)
      post = Post.create(author_id: user.id, Title: 'Test Post', Text: 'This is a test post', CommentsCounter: 0,
                         LikesCounter: 0)

      comment = Comment.create(user: user, post: post, Text: 'Test Comment')

      expect { comment.update_comments_counter }.to change { post.reload.CommentsCounter }.by(1)
    end
  end

  describe '#decrement_comments_counter' do
    it 'decrements the post\'s CommentsCounter' do
      user = User.create(Name: 'Test User', Photo: 'https://example.com', Bio: 'Test Bio', PostsCounter: 0)
      post = Post.create(author_id: user.id, Title: 'Test Post', Text: 'This is a test post', CommentsCounter: 0,
                         LikesCounter: 0)
      comment = Comment.create(user: user, post: post, Text: 'Test Comment')

      expect { comment.decrement_comments_counter }.to change { post.reload.CommentsCounter }.by(-1)
    end
  end
end
