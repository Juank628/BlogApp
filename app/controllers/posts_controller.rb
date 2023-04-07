class PostsController < ApplicationController
  def index
    user_id = request.params['id'].to_i
    @user = User.find(user_id)
    @posts_list = @user.posts.all
  end

  def show
    post_id = request.params['id'].to_i
    @post = Post.find(post_id)
  end

  def new; end

  def create
    data = params.require('data')

    new_post = Post.new(author: current_user, title: data['title'], text: data['text'], comments_counter: 0,
                        likes_counter: 0)
    if new_post.save
      redirect_to '/users'
    else
      redirect_to '/posts/new'
      flash[:error] = 'Error. Please try again'
    end
  end
end
