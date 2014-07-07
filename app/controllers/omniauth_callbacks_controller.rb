class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def all
    omniauth = request.env['omniauth.auth']

    authentication = Authentication.find_by_provider_and_uid omniauth.provider, omniauth.uid.to_s
    user = if authentication
      flash.notice = 'Signed in successfully.'
      authentication.user
    elsif current_user
      current_user.authentications.create! provider: omniauth.provider, uid: omniauth.uid
      flash.notice = 'Authentication successful.'
      current_user
    else
      user = User.new
      user.authentications.build provider: omniauth.provider, uid: omniauth.uid
      user.save!
      user
    end

    user.email ||= omniauth.info.email
    user.username ||= omniauth.info.nickname
    user.save

    # where(auth.slice(:provider, :uid)).first_or_create do |user|
    #   user.provider = auth.provider
    #   user.uid = auth.uid
    #   user.email = auth.info.email
    #   user.given_name = auth.info.first_name
    #   user.family_name = auth.info.last_name
    #   user.nickname = auth.info.nickname
    # end

    # user = User.from_omniauth request.env['omniauth.auth'], current_user
    if user.persisted?
      flash.notice = 'Signed in!'
      sign_in_and_redirect user
    else
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url
    end
  end

  alias_method :facebook, :all
  alias_method :github, :all
end
