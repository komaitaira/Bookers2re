class ApplicationController < ActionController::Base
# devise利用の際に以下のアクションが事前に行われる
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
# sign_up/inの際にnameカラムを利用
end
