class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:encrypted_password,:firstname_kanji,:lastname_kanji,:firstname_kana,:lastname_kana,:birth])
  end
end
