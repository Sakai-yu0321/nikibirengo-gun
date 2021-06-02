class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @like = Like.new(user_id: current_user.id, post_id: params[:post_id])
    # redirect_to post_path(params[:post_id]), notice:"いいねをしました"

    respond_to do |format|
      if @like.save
        format.html { redirect_to post_path(params[:post_id]), notice:"いいねをしました" }
        format.json { render json: {status: 'success', like: @like, counts: Like.where(post_id: @like.post_id).count, liked: true} }
      else
        format.html { render 'posts/show' }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Like.find_by(post_id: params[:post_id], id: params[:id]).destroy
    redirect_to post_path(params[:post_id]), notice:"いいねを取り消しました"
  end
end
