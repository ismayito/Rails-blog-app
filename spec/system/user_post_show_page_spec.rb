require 'rails_helper'
describe 'Should show posts show page' do
  before do
    @user = User.create(Name: 'Test User', PostsCounter: 0)
    @post = @user.posts.create(Title: 'Test Post', Text: 'This is a test post.')
    @comment = @post.comments.create(user: @user, Text: 'This is a test comment.')
  end
  it 'Should show post title' do
    visit user_post_path(@user, @post)
    expect(page).to have_content(@post.Title)
  end

  it 'Should show post post author' do
    visit user_post_path(@user, @post)
    expect(page).to have_content(@user.Name)
  end

  it 'Should show number of comments' do
    visit user_post_path(@user, @post)
    expect(page).to have_content(@post.comments.count)
  end

  it 'Should show number of likes' do
    visit user_post_path(@user, @post)
    expect(page).to have_content(@post.likes.count)
  end

  it 'Should show the post body' do
    visit user_post_path(@user, @post)
    expect(page).to have_content(@post.Text)
  end

  it 'Should show  each name of a commentor and the comment left' do
    visit user_post_path(@user, @post)
    @post.comments.each do |comment|
      expect(page).to have_content(@post.author.Name)
      expect(page).to have_content(comment.Text)
    end
  end
end
