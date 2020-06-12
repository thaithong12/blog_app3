class UsersController < ApplicationController
  before_action :load_user, only: :create
  def new
    @user = User.new
  end

  def create
    #load_user
    @user = User.new user_params
    #byebug
  	if @user.save
      #byebug
      #@user.send_activation_email
      @user.update_attribute :role, 0
  	  flash[:success] = "Check your email to activate your account"	
  	  redirect_to root_path	
  	else
  	  flash.now[:danger] = "Create account fail!!!"	
  	  render :new
  	end
  end

  private
  def user_params 
  	params.require(:user).permit(:user_name,:email,:password,:password_confirmation,:address,:birthday,:image_url)
  end

  def load_user
        @user = User.find_by id: params[:id]
  end
end
