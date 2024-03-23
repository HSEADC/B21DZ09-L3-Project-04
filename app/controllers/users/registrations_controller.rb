class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_permitted_parameters, only: [:update]

  def new
    build_resource({})
    resource.build_profile
    respond_with resource
  end

  protected

  def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:account_update) do |user_params|
    user_params.permit(:email,
      :name,
      :nickname,
      :birthday,
      :tg,
      :avatar_image,
      :password,
      :password_confirmation,
      :current_password,
      :remember_me,
      :role)
  end
end

  # def sign_up_params
  #   puts "=============================="
  #   devise_parameter_sanitizer.permit(:account_update, keys: [user: [:email,
  #     :name,
  #     :nickname,
  #     :birthday,
  #     :tg,
  #     :password,
  #     :password_confirmation,
  #     :remember_me,
  #     :role]])
  #   # devise_parameter_sanitizer.sanitize(:sign_up) { |user| user.permit(permitted_attributes) }
  # end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: permitted_attributes)
  end

 def permitted_attributes
    [
      :email,
      :name,
      :nickname,
      :birthday,
      :tg,
      :password,
      :password_confirmation,
      :remember_me,
      :role,
    ]
  end

  #   def permitted_attributes
  #   {
  #     email: :email,
  #     name: :name,
  #     birthday: :birthday,
  #     tg: :tg,
  #     avatar_image: :avatar_image,
  #     nickname: :nickname,
  #     password: :password,
  #     password_confirmation: :password_confirmation,
  #     remember_me: :remember_me,
  #     role: :role
  # }
  # end
end
