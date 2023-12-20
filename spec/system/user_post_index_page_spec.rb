require 'rails_helper'

describe 'Should show user post index page' do
  before do
    @user = User.create!(Name: 'user1', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'This is a bio',
                         PostsCounter: 3)
    @post = @user.posts.create!(Title: 'Test Post', Text: 'This is a test post.')
    @comment = @post.comments.create!(user: @user, Text: 'This is a test comment.')
    @post.likes.create!(user: @user)
  end

  it 'displays the user profile picture' do
    visit user_posts_path(@user)
    expect(page).to have_css("img[src*= '#{@user.Photo}']")
  end

  it 'displays the user`s name ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@user.Name)
  end

  it 'displays the Number of posts of a user ' do
    visit user_posts_path(@user)
    expect(page).to have_text(@user.posts.count)
  end

  it 'displays the Number of comments a post has ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@post.comments.count)
  end

  it 'displays the Number of Likes a post has ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@post.likes.count)
  end

  it 'displays likes,body,comment ' do
    visit user_posts_path(@user)
    expect(page).to have_content(@post.Text)
    expect(page).to have_content(@comment.Text)
  end

  it ' should show a button that enables me to see all posts' do
    visit user_posts_path(@user)
    button_container = find('.button-container')
    pagination_button = button_container.find('.see-all')
    pagination_button.click

    # Assert that the button is visible on the page
    expect(pagination_button).to be_visible
  end

  it 'Should redirect me to the  user`s post`s show page' do
    visit user_posts_path(@user)
    click_link @post.Text
    expect(page).to have_current_path(user_post_path(@user, @post))
  end
end
