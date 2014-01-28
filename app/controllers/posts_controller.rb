class PostsController < ApplicationController
  def index
    @posts = Post.published
    @categories = Category.all
  end

  def show
    @post = Post.published.find params[:id]
    @comments = @post.comments
    @comment = Comment.new
  end
end
