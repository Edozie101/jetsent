class RegistrationsController < Devise::RegistrationsController

    def create
        super
        puts "WE ARE IN THE REGISTRATION"
        current_or_guest_user
    end

    def update_resource(resource, params)
        if current_user.provider == "facebook"
          params.delete("current_password")
          resource.update_without_password(params)
        else
          resource.update_with_password(params)
        end
    end
    private

    def sign_up_params
        params.require(:user).permit(:email,:password,:password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:email,:password,:password_confirmation)
    end

end
