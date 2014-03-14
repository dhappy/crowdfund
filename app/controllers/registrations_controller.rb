class RegistrationsController < Devise::RegistrationsController
  def update
    account_update_params = devise_parameter_sanitizer.sanitize :account_update

    if account_update_params[:password].blank?
      account_update_params.delete 'password'
      account_update_params.delete 'password_confirmation'
    end

    @user = current_user
    if @user.update_attributes account_update_params
      set_flash_message :notice, :updated
      sign_in @user, bypass: true
      redirect_to after_update_path_for @user
    else
      render 'edit'
    end
  end

  protected

  def after_sign_up_path_for resource
    root_path
  end
end
