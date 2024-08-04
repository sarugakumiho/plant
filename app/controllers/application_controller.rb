class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top]

  def after_sign_in_path_for(resource)
    users_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
  #初期状態の devise は、サインアップ、サインイン時に「email」と「パスワード」しか受け取ることを許可されていません。
  #そのためname追加

end