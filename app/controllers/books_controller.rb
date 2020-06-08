class BooksController < ApplicationController
    
    def index
        
    end
    def new
        @book = Book.new
    end
    
    def show
        @categories = Category.all
        @book = Book.find_by id: params[:id]
    end
    def create
        
    end
    def edit
        
    end

    def update
        
    end
    
    
    
    
    
end
