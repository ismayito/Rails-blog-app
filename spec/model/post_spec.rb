require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(author_id: 1, Title: 'Post 1', Text: 'This is post 1', CommentsCounter: 0, LikesCounter: 0) }

  before { subject.save }
  it 'Title should not be blank' do
    subject.Title = nil
    expect(subject).to_not be_blank
  end

  it 'Title should not exceed 250 characters' do
    subject.Title = 'a' * 250
    expect(subject).to_not be_valid
  end

  it 'should have CommentsCouner greater than or equal to zero' do
    subject.CommentsCounter = 2
    expect(subject.CommentsCounter).to be >= 0
  end

  it 'should have LikesCouner greater than or equal to zero' do
    subject.LikesCounter = 2
    expect(subject.LikesCounter).to be >= 0
  end

  describe '#five_most_recent_posts_for_comment' do
    # create a user
    user = User.create(Name: 'Mayito', Photo: 'https://www.google.com/url', Bio: 'He is a software developer',
                       PostsCounter: 0)
    # create a post
    post = Post.create!(author_id: user.id, Title: 'Post 1', Text: 'This is post 1', CommentsCounter: 0,
                        LikesCounter: 0)

    # create 5 comments on a post
    comment1 = Comment.create(post: post, user: user, Text: 'Hey Tom')
    comment2 = Comment.create(post: post, user: user, Text: 'Hey Tom')
    comment3 = Comment.create(post: post, user: user, Text: 'Hey Tom')
    comment4 = Comment.create(post: post, user: user, Text: 'Hey Tom')
    comment5 = Comment.create(post: post, user: user, Text: 'Hey Tom')

    result = post.five_most_recent_posts_for_comment.to_a

    it 'should return five most recent posts' do
      expect(result).to be_an(Array)
      expect(result.size).to eq(5)
      expect(result).to include(comment1, comment2, comment3, comment4, comment5)
    end
  end

  describe '#update_post_counter' do
    it 'increments the author\'s PostsCounter' do
      user = User.create(Name: 'Test User', Photo: 'https://example.com', Bio: 'Test Bio', PostsCounter: 0)
      post = Post.create(author_id: user.id, Title: 'Test Post', Text: 'This is a test post')

      expect { post.send(:update_post_counter) }.to change { user.reload.PostsCounter }.by(1)
    end
  end

  describe '#decrement_post_counter' do
    it 'decrements the author\'s PostsCounter' do
      user = User.create(Name: 'Test User', Photo: 'https://example.com', Bio: 'Test Bio', PostsCounter: 1)
      post = Post.create(author_id: user.id, Title: 'Test Post', Text: 'This is a test post')

      expect { post.send(:decrement_post_counter) }.to change { user.reload.PostsCounter }.by(-1)
    end
  end
end
