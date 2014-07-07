class RegistrationsController < Devise::RegistrationsController
  def update
    @user = current_user
    params = account_update_params

    if params[:password].blank?
      params.delete :password
      params.delete :password_confirmation
    end

    successfully_updated =
      if needs_password?(@user, params)
        @user.update_with_password params
      else
        params.delete :current_password
        @user.update_without_password params
      end

    if successfully_updated
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to after_update_path_for @user
    else
      render 'edit'
    end
  end

  protected

  def after_sign_up_path_for resource
    root_path
  end

  private
  
  def needs_password?(user, params)
    user.email != params[:email] or params[:password].present?
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :rate)
  end
end
