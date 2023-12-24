class Api::V1::PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    if @posts.present?
      render json: { success: true, user: { user_id: @user.id, Name: @user.Name, posts: @posts } }
    else
      render json: { success: false, message: 'No posts found' }, status: :not_found
    end
  end
end
