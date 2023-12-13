require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET/index' do
    it 'should return http success for users' do
      get users_url
      expect(response).to be_successful
      expect(response).to render_template(:index) # should ensure that the correct template is rendered
      assert_equal 'index', @controller.action_name # should ensure the right action is rendered
      # should correct body for the post view file is rendered
      assert_match 'Here is the list of users for the rails blog app', @response.body
    end
  end

  describe 'GET/index/:id' do
    it 'should return http success for user' do
      get user_url(User.last)
      expect(response).to be_successful
      expect(response).to render_template(:show) # should ensure that the correct template is rendered
      assert_equal 'show', @controller.action_name # should ensure the right action is rendered
      # should correct body for the post view file is rendered
      assert_match 'Shows a specific user', @response.body
    end
  end
end
