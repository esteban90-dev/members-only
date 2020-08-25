class PostsController < ApplicationController

  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    if @post.save
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
