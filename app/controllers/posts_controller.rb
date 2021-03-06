class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :user_access_limit, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order('created_at DESC')
  end

  def search
    @posts = Post.search(params[:keyword])
  end

  def sort
    @posts = Post.where(category_id: params[:category_id]).order('created_at DESC')
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.order('created_at DESC').includes(:user)
    if user_signed_in?
      @like = Like.find_by(post_id: params[:id], user_id: current_user.id)
      @likes_count = Like.where(post_id: @post.id).count
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id), notice: '投稿が完了しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to post_path, notice: '編集が完了しました'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, alert: '投稿を削除しました'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:category_id, :title, :text, :image).merge(user_id: current_user.id)
  end

  def user_access_limit
    redirect_to root_path if @post.user_id != current_user.id
  end
end
