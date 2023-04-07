class CommentsController < ApplicationController
  def new
    @user = current_user
    @post_id = params.require('id')  
end

  def create
    data = params.require('data')
    post_id = params.require('id')
    post = Post.find(post_id)

    newComment = Comment.new(post: post, user: current_user, text: data['text'])
    if newComment.save
      redirect_to '/users'
    else
      redirect_to '/posts/new'
      flash[:error] = "Error. Please try again"
    end
  end
end