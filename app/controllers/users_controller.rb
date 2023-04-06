class UsersController < ApplicationController
  def index
    @users_list = User.all
  end

  def show
    id = request.params['id'].to_i
    @user = User.find(id)
    @posts_list = @user.recent_posts
  end
end
