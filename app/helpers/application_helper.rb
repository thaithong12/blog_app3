module ApplicationHelper

    def current_user
        @current_user ||= User.find_by id: session[:user_id]
	end

	def login_user user
		session[:user_id] = user.id
	end

    def is_admin? 
        return true if (current_user.role == 1)
    end
    
    def get_name
        current_user.user_name
    end

    def get_categories
        @categories = Category.all.order("created_at ASC").uniq
    end
    
    
    
end
