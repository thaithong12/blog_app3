class FavouritesController < ApplicationController
  before_action :is_login? ,only: [:index,:destory]
  def index
    book_favourites = current_user.favorite_books
    list_book_return = []
    if book_favourites.any?
      book_favourites.each do |item|
        list_book_return.push item.book
      end
    end
    @books = list_book_return
    @books = @books.paginate(page: params[:page], per_page: 15)
    # byebug
  end

  def change_favourite
    begin
      @book = Book.find_by id: params[:id]
      @book.favorite_books.build(user_id: current_user.id)
      if @book.save 
        flash[:success] = "Add Favourite Book Successs"
          redirect_to root_path
      end
    rescue => exception
      redirect_to root_path
    end
  end

  def destroy
    # @book = Book.find_by id: params[:id]
    
    u =  FavoriteBook.where(user_id: current_user.id, book_id: params[:id]).first.destroy
    if u.destroy
      flash[:success] = "Delete Succeess"
    end
    
    redirect_to favourites_path
  end
  


end
