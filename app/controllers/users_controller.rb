class UsersController < ApplicationController
  layout 'blog_application'
  before_action :authenticate_user! , only: [:index]
  before_action :require_login, only:[:index]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private 
  def require_login
    redirect_to users_path unless user_signed_in?
  end
end
