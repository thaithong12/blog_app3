class SessionsController < ApplicationController
    def index
        
    end
    
    def create
        @user = User.find_by email: params[:sessions][:email].downcase
        if @user.present? && @user.is_active && @user.authenticate(params[:sessions][:password])
            session[:user_id] = @user.id        
            flash[:success]= "Login Success !"
            redirect_to root_path
        else
            flash.now[:danger] = "Login Failed !"
            render :index
        end
    end
  
    def destroy
      session.delete(:user_id)
      current_user = nil;
      redirect_to root_path
    end
  



end
