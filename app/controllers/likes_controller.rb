class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    Like.create(likes_params)
    redirect_to post_path(params[:post_path])
  end

  def destroy
    Like.find_by(id: params[:id].post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def likes_params
    params.require(:like).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
