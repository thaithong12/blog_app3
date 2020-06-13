module ApplicationHelper

    def current_user
      if (user_id = session[:user_id])
        @current_user ||= User.find_by id: user_id
      elsif (user_id = cookies.signed[:user_id])  
        user = User.find_by id: user_id
        if user.present? && user.authenticate?(:remember, cookies[:remember_token])
          @current_user = user
        end  
      end  
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

    def remember user
        user.remember
        cookies.permanent[:remember_token] = user.remember_token        
        cookies.permanent.signed[:user_id] = user.id 
    end
  
    def forget user
        user.forget
        cookies.delete(:remember_token)
        cookies.delete(:user_id)
    end
    
    
end
