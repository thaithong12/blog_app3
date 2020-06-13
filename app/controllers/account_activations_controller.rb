class AccountActivationsController < ApplicationController
  def edit
	  user =User.find_by email:params[:email]
	  if user && !user.is_active?&& user.authenticate?(:activation,params[:id])
	    user.activate
	    login_user user
	    #byebug
	    remember(user)
	    #flash[:success]="Account activated!"
	    redirect_to root_url
      else
	    #flash[:danger]="Invalid activation link"
	    redirect_to root_url
	  end
	end	
end
