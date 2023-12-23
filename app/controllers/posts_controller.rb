class PostsController < ApplicationController
  load_and_authorize_resource
  skip_authorization_check only: [:create]
  def index
    @posts_by_author = Post.includes(:author).group_by(&:author)
    serialized_posts = {}
    @posts_by_author.each do |author, post|
      serialized_posts[author] = post.as_json(only: %i[Text Title])
    end
    render json: serialized_posts
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_posts_path(user_id: @post.author_id) }
      format.js
    end
  end
end
