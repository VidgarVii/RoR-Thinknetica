class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def default_url_options(options = {})
    { lang: (I18n.locale if I18n.locale != I18n.default_locale) }
  end

  protected

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : tests_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
