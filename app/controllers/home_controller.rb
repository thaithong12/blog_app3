class HomeController < ApplicationController
  before_action :check_login,only: [:index]
  def index
   
  end

  private
  def check_login
    return if current_user
      
			flash[:danger] = "You need Login !"
			redirect_to login_path
	end
end
