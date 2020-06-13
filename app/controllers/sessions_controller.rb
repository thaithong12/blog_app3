class SessionsController < ApplicationController
    before_action :is_login , only: [:index]
    def index
        
    end
    def create
        @user = User.find_by email: params[:sessions][:email].downcase
        if @user.present? && @user.authenticate(params[:sessions][:password])
          login_user @user 
          if params[:sessions][:remember_me] =="1"
            remember(@user)      
          else
            forget(@user)        
          end         
          #flash[:success] = "Login successfully"
          redirect_to root_path
        else
          #flash.now[:danger] = "Email or password incorrect!!!" 
          redirect_to login_path  
        end     
      end
    
      def destroy
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
        #flash[:success] = "Goodbye"
        redirect_to login_path
      end
    # def create
    #     @user = User.find_by email: params[:sessions][:email].downcase
    #     if @user.present? && @user.is_active && @user.authenticate(params[:sessions][:password])
    #         session[:user_id] = @user.id        
    #         flash[:success]= "Login Success !"
    #         redirect_to root_path
    #     else
    #         flash.now[:danger] = "Login Failed !"
    #         render :index
    #     end
    # end
  
    # def destroy
    #   session.delete(:user_id)
    #   current_user = nil;
    #   redirect_to root_path
    # end
  
    private 

    def is_login
        if current_user
            redirect_to root_path
        end
    end

end
