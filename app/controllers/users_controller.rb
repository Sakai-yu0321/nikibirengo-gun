class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:show]

  def show
    @posts = Post.where(user_id: params[:id])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
