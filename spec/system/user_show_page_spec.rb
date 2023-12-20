require 'rails_helper'
describe "Should show the view file of the user`s show page" do
    before do
        @user = User.create!(Name: 'user1', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'This is a bio',
        PostsCounter: 3)
        @post1 = Post.create!(author: @user, Title: 'Post 1', Text: "This is text1", CommentsCounter: 0, LikesCounter: 0)
        @post2 = Post.create!(author: @user, Title: 'Post 2', Text: "This is text2", CommentsCounter: 0, LikesCounter: 0)
        @post3 = Post.create!(author: @user, Title: 'Post 3', Text: "This is text3", CommentsCounter: 0, LikesCounter: 0)
    end

    it 'displays the user profile picture' do
        visit user_path(@user)
        expect(page).to have_css("img[src*= '#{@user.Photo}']")
    end

    it 'displays the bio' do
        visit user_path(@user)
        expect(page).to have_content(@user.Bio)
    end

    it 'displays the user`s name ' do
        visit user_path(@user)
        expect(page).to have_content(@user.Name)
    end

    it 'displays the Number of posts of a user ' do
        visit user_path(@user)
        expect(page).to have_content(@user.PostsCounter)
    end

    it 'displays the first three posts of a user ' do
        visit user_path(@user)
        expect(page).to have_content(@post1.Text)
        expect(page).to have_content(@post2.Text)
        expect(page).to have_content(@post3.Text)
    end

    it " should show a button that enables me to see all posts" do
        visit user_path(@user)
        button_container = find('.button-container')
        see_all_button = button_container.find('.see-all')
        see_all_button.click
   
       # Assert that the button is visible on the page
       expect(see_all_button).to be_visible
       #  Should redirect me to the users  post`s index page
     expect(page).to have_current_path(user_posts_path(@user))
    end

    it 'Should redirect me to the  user`s post`s show page' do 
        visit user_path(@user)
        click_link @post1.Text
        expect(page).to have_current_path(user_post_path(@post1, @user))
    end
end