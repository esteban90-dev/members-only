class PostsController < ApplicationController
  before_action :authenticate_member!, except: [:index]
  before_action :require_permission, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all 
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_member.posts.new(post_params)
    if @post.save
      flash.notice = "Successfully created a new post!"
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
      flash.notice = "Successfully updated a post!"
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash.notice = "Post deleted!"
    redirect_to root_url
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  def require_permission
    if Post.find(params[:id]).member != current_member
      flash.notice = "You don't have permission to do that!"
      redirect_to root_url
    end
  end
end
