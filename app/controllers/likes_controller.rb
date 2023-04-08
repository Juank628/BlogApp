class LikesController < ApplicationController
  def create
    post_id = params.require('post_id')
    post_obj = Post.find(post_id)

    new_like = Like.new(post: post_obj, user: current_user)
    if new_like.save
      p 'success'
      flash[:msg] = 'Sucess!'
    else
      flash[:msg] = 'Error. Please try again'
    end
  end
end
