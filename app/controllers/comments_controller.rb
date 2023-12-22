class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :set_user_and_post
  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(params.require(:comment).permit(:Text).merge(user_id: current_user.id))
    if @comment.save
      flash[:success] = 'Comment saved successfully'
      redirect_to user_post_path(@post, @user)
    else
      flash.now[:error] = 'Post not saved, check your Entries'
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    flash[:notice] = 'Comment successfully deleted.'
    redirect_to user_post_path(@post.author_id, @post.id)
  end

  private

  def set_user_and_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
  end
end
