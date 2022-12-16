class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
# 　protect_from_forgery with: :exception



  # このアクションを追加
  def after_sign_in_path_for(resource)
    # "/user/#{current_user.id}"
    cart_index_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path # ログアウト後に遷移するpathを設定
  end

  protected

  # 入力フォームからアカウント名情報をDBに保存するために追加
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
