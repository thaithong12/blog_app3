module ApplicationHelper

    def current_user
        
    end

    def is_admin? 
       current_user.role == 1
	end
    
end
