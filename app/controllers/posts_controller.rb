class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post # post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post # post_path(@post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end