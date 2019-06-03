class UsersController < ApplicationController
  before_action :set_params
  def show
    @username = @user.username
    @email = @user.email
  end


    protected
    def set_params
        @user = User.find(params[:id])

    end

end
