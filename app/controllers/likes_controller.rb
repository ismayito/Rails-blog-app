class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like = @post.likes.build(user: current_user)

    respond_to do |format|
      if @like.save
        format.js { render js: 'window.location.reload();' } # Reload the page with JavaScript and update likes
      else
        format.js # Render JavaScript to handle the failure scenario if needed
      end
    end
  end
end
