class RegistrationsController < Devise::RegistrationsController
  def update
    @user = current_user
    account_update_params = devise_parameter_sanitizer.sanitize :account_update

    if account_update_params[:password].blank?
      account_update_params.delete 'password'
      account_update_params.delete 'password_confirmation'
    end

    successfully_updated =
      if needs_password?(@user, params)
        @user.update_with_password account_update_params
      else
        params[:user].delete(:current_password)
        @user.update_without_password account_update_params
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
    user.email != params[:user][:email] or params[:user][:password].present?
  end
end
