class LikesController < ApplicationController
  def new
    @likes = Like.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    if @like.save
      redirect_to user_post_path(@user, @post), notice: 'Like was sucessfully created.'
    else
      render :new
    end
  end
end
