class Api::V1::PostsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all

    if @posts
      render json: { status: "SUCCESS", message: "Fetched all the posts successfully", data: @posts }, status: :ok
    else
      render json: @posts.errors, status: :bad_request
    end
  end

  def create
    @post = Post.new(post_params)
    puts "Create :D"

    if @post.save!
      render json: { status: "SUCCESS", message: "Post was created successfully", data: @post }, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def show
    if @post
      render json: { data: @post }, state: :ok
    else
      renser json: { message: "Post could not be found" }, status: :bad_request
    end
  end

  def update
    if @post.update!(post_params)
      render json: { message: "Post was updated successfully", data: @post }, status: :ok
    else
      render json: { message: "Post cannot be updated" }, status: :unprocessable_entity
    end
  end

  def destroy
    if @post.destroy!
      render json: { message: "Post was deleted successfully" }, status: :ok
    else
      render json: { message: "Post does not exist" }, status: :bad_request
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
