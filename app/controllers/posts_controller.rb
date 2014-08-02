class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create params.require(:post).permit(:title, :body, :author_name)
    redirect_to @post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = 'Post was successfully destroyed'
    redirect_to root_path
  end
end
