class PostsController < ApplicationController
  def index
    user_id = request.params['id'].to_i
    @user = User.find(user_id)
    @posts_list = @user.recent_posts
  end

  def show; end
end
