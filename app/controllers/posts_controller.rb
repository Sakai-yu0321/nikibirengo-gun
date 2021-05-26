class PostsController < ApplicationController
  before_action :set_post, only: []

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :root_path
      flash[:notice] = "投稿が完了しました"
    else
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :text).merge(user_id: current_user.id)
  end
end
