class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    comment = Comment.create(comment_params)
    redirect_to "/posts/#{comment.post.id}"
  end

  def destroy
    comment = Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
    flash[:notice] = "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
