class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    Like.create(user_id: current_user.id, post_id: params[:post_id])
    redirect_to post_path(params[:post_id]), notice:"投稿に「いいね」をしました"
  end

  def destroy
    Like.find_by(post_id: params[:post_id], id: params[:id]).destroy
    redirect_to post_path(params[:post_id]), notice:"いいねを取り消しました"
  end
end
