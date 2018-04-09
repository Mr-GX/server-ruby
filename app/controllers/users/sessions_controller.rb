class Users::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    super
  end

  # POST /resource/sign_in
  def create
    user = User.find_by(mobile: params[:user][:mobile])
    if user.present? 
      if user.valid_password?(params[:user][:password])
        sign_in user
        if return_to = session.delete(:return_to)
          redirect_to return_to
        else
          redirect_to welcome_index_path
        end
      else
        flash[:alert] = "密码错误!"
        redirect_to new_user_session_path
      end
    else
      redirect_to controller:'registrations',action:'new'
    end
  end

  # DELETE /resource/sign_out
  def destroy
    Rails.logger.info "tttttttttttt"
    sign_out current_user
    redirect_to welcome_index_path
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
