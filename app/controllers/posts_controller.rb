class PostsController < ApplicationController
  def index
    @posts_by_author = Post.includes(:author).group_by(&:author)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(params.require(:post).permit(:Title, :Text))
    if @post.save
      flash[:success] = 'Post saved successfully'
      redirect_to user_posts_path
    else
      flash.now[:error] = 'Post not saved, check your Entries'
      render :new
    end
  end
end
