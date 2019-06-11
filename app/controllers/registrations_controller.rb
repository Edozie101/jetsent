class RegistrationsController < Devise::RegistrationsController

    def create
        super
        puts "WE ARE IN THE REGISTRATION"
        current_or_guest_user
    end

    private

    def sign_up_params
        params.require(:user).permit(:email,:password,:password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:email,:password,:password_confirmation)
    end

end
