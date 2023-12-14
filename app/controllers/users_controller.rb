class UsersController < ApplicationController
  layout 'blog_application'
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
