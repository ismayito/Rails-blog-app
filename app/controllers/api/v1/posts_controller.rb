class Api::V1::PostsController < ApplicationController
  def index
    @posts = current_user.posts
    if @posts.present?
      render json: { success: true, user: { user_id: current_user.id, Name: current_user.name, posts: @posts } }
    else
      render json: { success: false, message: 'No posts found' }, status: :not_found
    end
  end
end
