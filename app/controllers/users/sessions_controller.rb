class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]
  layout 'desk'
  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    u = User.find_by_email(params[:user][:email])
    if u.present? && u.valid_password?(params[:user][:password])
      sign_in u, bypass: true
      if return_to = session.delete(:return_to)
          redirect_to return_to
      else
          redirect_to root_path
      end
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
