class CategoriesController < ApplicationController
  def show
      book_categories = Category.all.find_by(id: params[:id])
      @books = []
      if book_categories
        if book_categories.books.any? 
          @books = book_categories.books.paginate(:page => params[:page], :per_page => 10)
          flash[:success] = "Have #{@books.size} Record"
        else
          flash[:danger] = "Don't Have any Record"
        end
        
      end
      
      
  end
end
