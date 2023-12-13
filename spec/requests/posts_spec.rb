require 'rails_helper'

RSpec.describe 'Posts' do
  describe 'GET/index/:id/posts' do
    it 'should return http success for user`s posts' do
      get user_posts_url(Post.last)
      expect(response).to be_successful
      expect(response).to render_template(:index) # should ensure that the correct template is rendered
      assert_equal 'index', @controller.action_name # should ensure the right action is rendered
      # should correct body for the post view file is redered
      assert_match 'Displays a list of posts from a user', @response.body
    end
  end

  describe 'GET/index/:id/:id/posts/:id' do
    it 'should return http success for user`s post' do
      get user_post_url(user_id: User.last, id: Post.last.id)
      expect(response).to be_successful
      expect(response).to render_template(:show) # should ensure that the correct template is rendered
      assert_equal 'show', @controller.action_name # should ensure the right action is rendered
      # should correct body for the post view file is redered
      assert_match 'Shows a single post from a user ...', @response.body
    end
  end
end
