class PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def new
    @post_new = Post.new
  end
  
  def create
    @post_new = Post.new(post_params)
    @post_new.user = current_user
    if @post_new.save
      flash[:notice] = "無事投稿されました🌿"
      redirect_to post_path(@post_new)
    else
      @posts = Post.all
      render :index
    end
  end
  
  def index
    @posts = Post.all
    @post_new = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "編集が完了しました🌱"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
  
  def is_matching_login_user
    post = Post.find(params[:id])
    unless post.user == current_user
      redirect_to posts_path  
    end
  end
end