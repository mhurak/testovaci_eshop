class AdminSessionsController < ApplicationController

  layout "admin"

  def new
  end

  def create
    if params[:email] == "mhurak@gmail.com" && params[:password] == "heslo"
      session[:logged] = true
      redirect_to admin_posts_url
    else
      flash[:alert] = "Nesprávny email alebo heslo!"
      render :new
    end
  end

  def destroy
    session[:logged] = nil
    flash[:alert] = "Bol si odhláseny!"
    redirect_to new_admin_session_url
  end

end
