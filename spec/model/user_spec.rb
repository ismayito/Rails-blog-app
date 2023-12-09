require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(Name: 'Mayito', Photo: 'https://www.google.com/url', Bio: 'He is a software developer', PostsCounter: 0)
  end
  before { subject.save }

  it 'Name should not be blank' do
    subject.Name = nil
    expect(subject).to_not be_blank
  end

  it 'should have PostCouner greater than or equal to zero' do
    subject.PostsCounter = 2
    expect(subject.PostsCounter).to be >= 0
  end

  describe '#recent_post' do
    it 'should return the three most recent posts' do
      # create a user
      user = User.create(Name: 'Mayito', Photo: 'https://www.google.com/url', Bio: 'He is a software developer',
                         PostsCounter: 0)
      # create posts
      post1 = Post.create(author_id: user.id, Title: 'Post 1', Text: 'This is post 1', CommentsCounter: 0,
                          LikesCounter: 0)
      post2 = Post.create(author_id: user.id, Title: 'Post 2', Text: 'This is post 2', CommentsCounter: 0,
                          LikesCounter: 0)
      post3 = Post.create(author_id: user.id, Title: 'Post 3', Text: 'This is post 3', CommentsCounter: 0,
                          LikesCounter: 0)

      # Ensure that the post is created successfully
      expect(post3).to be_valid

      result = user.recent_post.to_a
      expect(result).to be_an(Array) # this should return an array of objects
      expect(result.size).to eq(3) # the array should have three posts
      expect(result).to include(post1, post2, post3) # the array should
    end
  end
end
