module BooksHelper
    def get_categories
        @categories = Category.all.order("created_at DESC")
    end

    def get_books_with_rating
        @book_rating = Book.all.order("rating DESC").limit(10)
    end
    
    def get_book_with_favourites 
        
    end
    
    
end
