class AccountActivationsController < ApplicationController
  def edit
	  user =User.find_by email:params[:email]
	  if user && !user.is_active?&& user.authenticate?(:activation,params[:id])
	    user.activate
	    login_user user
	    #flash[:success]="Account activated!"
	    redirect_to user
      else
	    #flash[:danger]="Invalid activation link"
	    redirect_to root_url
	  end
	end	
end
