class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

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
    @post = Post.find(params[:id])

    @post.destroy

    redirect_to root_path
  end
end