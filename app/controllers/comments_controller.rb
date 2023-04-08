class CommentsController < ApplicationController
  def new
    @user = current_user
    @post_id = params.require('post_id')
    @comment = Comment.new
  end

  def create
    data = params.require('data')
    post_id = params.require('post_id')
    post_obj = Post.find(post_id)

    new_comment = Comment.new(post: post_obj, user: current_user, text: data['text'])
    if new_comment.save
      redirect_to "/users/#{post_obj.author.id}/posts/#{@post_id}"
    else
      redirect_to '/posts/new'
      flash[:error] = 'Error. Please try again'
    end
  end
end
