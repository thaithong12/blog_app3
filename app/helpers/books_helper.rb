module BooksHelper
    def get_categories
        categories = Category.all.order("created_at DESC")
    end
    
end
