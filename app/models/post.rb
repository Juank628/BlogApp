class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def self.update_counter(user_id, value)
    user = User.where(id: user_id)
    user.update(posts_counter: value)
  end

  def self.get_recent_comments(pos_id)
    comments.order(created_at: :desc).limit(5)
  end
end
