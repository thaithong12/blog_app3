class HomeController < ApplicationController
  before_action :check_login,only: [:index]
  def index
      @books_new =  Book.all.by_created_at_desc.paginate(page: params[:page], per_page: 10)
  end

  private
  def check_login
    return if current_user
			flash[:danger] = "You need Login !"
			redirect_to login_path
	end
end
