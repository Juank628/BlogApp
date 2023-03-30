class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def self.update_counter(post_id, value)
    post = Post.where(id: post_id)
    post.update(comments_counter: value)
  end
end
