class PostsController < ApplicationController
  def index
    user_id = request.params['id'].to_i
    @user = User.includes(posts: [comments: [:user]]).find(user_id)
  end

  def show
    post_id = request.params['id'].to_i
    @post = Post.find(post_id)
    @current_user = current_user
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.new(post_params)

    if new_post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      redirect_to '/posts/new'
      flash[:error] = 'Error. Please try again'
    end
  end

  def post_params
    params.require(:data).permit(:title, :text)
  end
end
