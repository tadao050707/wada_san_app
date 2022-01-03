class ApplicationController < ActionController::Base
  before_action :authenticate_user!, if: :use_auth?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when User
      menus_path
    when Admin
      menus_path
    end
  end

  private
  def configure_permitted_parameters
    # サインアップ時にnameのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :nickname])
    # deviseのUserモデルに関わるログインや新規登録などのリクエストからパラメーターを取得できるようになるメソッド
    # アカウント編集の時にnameとprofileのストロングパラメータを追加
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :nickname])
  end

  def use_auth?
    unless controller_name == "tops" && action_name == "index"
      true
    end
  end
end
