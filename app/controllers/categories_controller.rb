class CategoriesController < ApplicationController
  def show
    @category = Category.find params[:id]
    @posts = @category.posts.published

    @categories = Category.all
  end
end
