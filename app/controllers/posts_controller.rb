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
    @post.update(title: params[:post][:title], content: params[:post][:content])

    redirect_to post_path(@post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: params[:post][:title], content: params[:post][:content])

    @post.save

    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy

    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end