class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def require_admin_session
    unless session[:logged]
      flash[:alert] = "Pre vstup sa musíš prihlásiť!"
      redirect_to new_admin_session_url
    end
  end
end
