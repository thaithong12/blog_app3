class SessionsController < ApplicationController
    before_action :is_login , only: [:index]
    def index
        
    end
    def create
        @user = User.find_by email: params[:sessions][:email].downcase
        if @user.present? && @user.authenticate(params[:sessions][:password])
          login_user @user 
          if @user.is_active?
            login_user @user
            params[:sessions][:remember_me]=="1"? remember(@user): forget(@user)
            #flash[:success] = "Login successfully"
            redirect_to root_path
          else
            #message ="Account not activated. Check your email for the activation link." 
            #flash[:warning]= message
            redirect_to login_path
          end
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
    
  
    private 

    def is_login
        if current_user
            redirect_to root_path
        end
    end

end
