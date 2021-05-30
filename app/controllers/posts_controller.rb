class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :user_access_limit, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order("created_at DESC")
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
    if user_signed_in?
      @like = Like.find_by(post_id: params[:id], user_id: current_user.id)
    end
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
      redirect_to root_path, notice: "投稿が完了しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to post_path, notice: "編集が完了しました"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "投稿を削除しました"
  end
  
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:category_id, :title, :text, :image).merge(user_id: current_user.id)
  end

  def user_access_limit
    if @post.user_id != current_user.id
      redirect_to root_path
    end
  end
end
