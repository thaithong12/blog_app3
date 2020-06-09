class BooksController < ApplicationController
    before_action :is_login? ,only: [:create,:destroy]
    
    
    def index
        @books = Book.by_created_at.paginate(page: params[:page], per_page: 30)
        # where(status: 1)
        # byebug
    end
    def new
        @book = Book.new
    end
    
    def show
        @book = Book.find_by id: params[:id]
    end
    def create
        @book= current_user.books.build book_params
        # @book = Book.new(book_params)      
        @book.image_url.attach book_params[:image_url] 
        @book.status = 0
        if is_admin?
            @book.status = 1
        end
      
       if @book.save
            flash[:success] = "Create Book Success !"
            byebug
            redirect_to root_path
       else
            byebug
            flash.now[:danger] = "Create Book Failed !"
            render :new
       end
       
    end

    
    
    def edit
       @book = Book.find(params[:id]) 
    end

    def update
        @book =Book.find(params[:id])
        if @book.update(book_params)
            flash[:success] = "Update Success !"
            redirect_to books_path
        end
    end

    def change_status
        redirect_to :index
    end
    
    private 

    def book_params 
        params.require(:book).permit :book_name, :description,:publish_date,:category_id,:author,:image_url
    end
    
    
    def is_login?
        return if current_user
            redirect_to login_path
    end
    
    
end
