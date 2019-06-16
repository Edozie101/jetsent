class BillingController < ApplicationController

    def new_card
        respond_to do |format|
          format.js
        end
      end

    def index
        @user=current_user.email
    end



end
