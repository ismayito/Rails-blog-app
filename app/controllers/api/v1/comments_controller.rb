class Api::V1::CommentsController < ApplicationController
  def index
    user_posts = current_user.posts.includes(:comments)
    comments_by_post = user_posts.map { |post| { post_id: post.id, comments: post.comments } }
    render json: { success: true, comments_by_post: comments_by_post }
  end

  def create
    post = current_user.posts.find_by(id: params[:post_id])
    if post
      comment = post.comments.build(comment_params)
      comment.user = current_user
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
