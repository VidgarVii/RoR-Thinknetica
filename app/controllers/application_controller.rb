class ApplicationController < ActionController::Base

  helper_method :current_user, :authenticate_user!, :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:fullpath] = request.fullpath
      redirect_to signin_path, alert: t('authenticate')
    end
  end

  def current_user
    @_current_user ||= User.find_by(id: session[:current_user_id]) if session[:current_user_id]
  end

  def logged_in?
    current_user.present?
  end
end
