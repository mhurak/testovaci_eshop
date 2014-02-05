class CartItemsController < ApplicationController

  def index
    session[:items] ||= []
    @cart_items_ids = session[:items]
  end

  def create
    session[:items] ||= []
    existing_items = session[:items].find_all{ |i| i[:product_id] == params[:product_id]}

    if existing_items.empty?
      session[:items] << { product_id: params[:product_id], quantity:1 }
    else
      existing_items[0][:quantity] += 1
    end
 
    redirect_to cart_items_url
  end

  def destroy
    session[:items].delete_if { |i| i[:product_id] == params[:id]}
    redirect_to cart_items_url
  end

end
