class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def facebook
		@user = User.from_omniauth(request.env["omniauth.ahut"])

		if @user.persisted?
			sign_in_and_redirect @user, :event => :authentication
			set_flash_message(:notice, :success, :kind => "Facebook") if is_navigationa_format?
		else
			session["devise.facebook_data"] = request.evn["omniauth.auth"]
			redirect_to new_user_registration_url
		end
	end

end
