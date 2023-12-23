class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    if @comments.present?
      render json: { success: true, post: { post_id: @post.id, TITLE: @post.Title, comments: @comments } }
    else
      render json: { success: false, message: 'No comment found' }, status: :not_found
    end
  end

  def create
    @user = User.find(params[:user_id])
    post = @user.posts.find_by(id: params[:post_id])
    if post
      comment = post.comments.build(comment_params)
      comment.user = @user
      if comment.save
        render json: { success: true, message: 'Comment created successfully' }, status: :created
      else
        render json: { success: false, message: 'Comment could not be created' }, status: :bad_request
      end
    else
      render json: { success: false, message: 'Post not found' }, status: :not_found
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:Text)
  end
end
