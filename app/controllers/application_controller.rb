class ApplicationController < ActionController::Base
  include InitializeFirestore

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :contact ])
  end

end
