class UsersController < ApplicationController
  before_action :set_params
  def show
    @username = @user.username
    @email = @user.email
  end

  def hello
      puts "hellooo"
      
  end

    protected
    def set_params
        @user = User.find(params[:id])
    end

end
