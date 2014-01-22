class PostsController < ApplicationController
  def index
    @posts = Post.published
  end

  def show
    @post = Post.published.find params[:id]
    @comments = @post.comments
    @comment = Comment.new
  end
end
