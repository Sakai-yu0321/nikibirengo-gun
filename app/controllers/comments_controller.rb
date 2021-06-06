class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment= Comment.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html {redirect_to post_path(@post)}
        format.json
      end
    else
      redirect_to post_path(params[:post_id])
    end
  end

  def destroy
    Comment.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id]), alert:"コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
