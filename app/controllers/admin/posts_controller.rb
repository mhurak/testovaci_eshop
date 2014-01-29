class Admin::PostsController < ApplicationController
  layout "admin"
  before_action :require_admin_session

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new params[:post].permit(:title, :body, :published, :category_id)

    if @post.save
      redirect_to admin_posts_url
    else
      render :new
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]

    if @post.update params[:post].permit(:title, :body, :published, :category_id)
      redirect_to admin_posts_url
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
      redirect_to admin_posts_url  
  end
end
