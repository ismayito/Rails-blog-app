class PostsController < ApplicationController
  def index
    @posts_by_author = Post.includes(:author).group_by(&:author)
  end

  def show
    @post = Post.find(params[:id])
  end
end
