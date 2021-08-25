class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 Refile.secret_key = '60c90fd2954672c77bb762761e51eeca52ec147a1f5aa047c7e1c689d0f09c047ecb9eb4100eef0cee2043c5218a8c32ba141037f035bc2002faa47b0ec6c516'

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_number, :address, :phone_number, :email, :experience, :comment, :encrypted_password, :image])
  end
  # ログイン後の画面遷移先
  def after_sign_in_path_for(resource) 
    recruiter_volunteers_path
  end
end

