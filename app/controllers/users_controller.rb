class UsersController < ApplicationController
  before_action :load_user, only: %i(edit update)
  before_action :correct_user, only: %i(edit update)
  def new
    @user = User.new
  end
  def edit
   
  end

  def update
    
    if @user.update_attributes user_params
      flash[:success] = "Update successfully"
      redirect_to root_path
    else
      flash.now[:danger] = "Update fail!!!" 
      render :edit
    end  
  end  

  def create
    @user = User.new user_params
    #byebug
    @user.image_url.attach(params[:user][:image_url])
    #byebug
    if @user.save
      #byebug
      @user.send_activation_email
           
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
  def correct_user
    if @user != current_user
      flash[:danger] = "Access denied"
      redirect_to root_path
    end     
  end
  def load_user
        @user = User.find_by id: params[:id]
  end
end
