class UsersController < ApplicationController
  def index
    @users_list = User.all
  end

  def show
  end
end
