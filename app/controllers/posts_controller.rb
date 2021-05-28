class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.order("created_at DESC")
  end

  def show
  end

  # def previous
  #   redirect_to "posts/#{params[:id]}/show"
  # end

  # def next
  # end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
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
    params.require(:post).permit(:category_id, :title, :text, :image).merge(user_id: current_user.id)
  end
end
