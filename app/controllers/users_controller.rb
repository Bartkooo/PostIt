class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.where(:user_id => current_user.friends).or(Post.where(:user_id => current_user))
  end

end
