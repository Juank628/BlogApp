class PostsController < ApplicationController
  def index
    user_id = request.params['id'].to_i
    @user = User.find(user_id)
    @posts_list = @user.posts.all
  end

  def show
    user_id = request.params['user_id'].to_i
    post_id = request.params['id'].to_i
    @post = Post.find(post_id)
  end
end
