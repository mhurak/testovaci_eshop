class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_admin

  private

  def current_admin
    @current_admin ||= AdminUser.find(session[:admin_user_id])
  end

  def require_admin_session
    unless session[:admin_user_id]
      flash[:alert] = "Pre vstup sa musíš prihlásiť!"
      redirect_to new_admin_session_url
    end
  end
end
