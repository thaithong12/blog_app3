class BooksController < ApplicationController
    before_action :is_login? ,only: [:create,:destroy,:index,:new, :show,:edit,:update,:change_status]

    
    def index
        if is_admin?
            @books = Book.all.by_created_at.paginate(page: params[:page], per_page: 15)
        else
            @books = current_user.books.paginate(page: params[:page], per_page: 15)
        end   
       
        # where(status: 1)
        # byebug
    end
    def get_type
       a = params[:type];
       byebug
       respond_to do |format|
           format.js { a  }
       end
        # where(status: 1)
        # byebug
    end
    def new
        @book = Book.new
        @name_button = "Create Book"
    end

    def search_admin
        begin
            a = params[:search][:search_text]
            book_list = Book.where("book_name LIKE '%#{a}%' ") 
            category_list = Category.where("category_name LIKE '%#{a}%'")
            book_cate = [];
            if category_list.any?
                category_list.each do |item|
                    item.books.each do |book|
                        book_cate.push book
                    end
                end
            end
            list_return = book_list + book_cate.uniq
            @books =  list_return.uniq
            @books =  @books.paginate(:page => params[:page], :per_page => 15)
            unless @books.any?
                flash[:danger] = "No Recored By Text"
                redirect_to :index
            end
          rescue
            flash[:danger] = "Failed No Record"
            redirect_to books_path
          end
       
    end
    
    
    def show
        @book = Book.find_by id: params[:id]
    end
    def create
        @book= current_user.books.build book_params      
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
    
    def destroy
        @book = Book.find_by id: params[:id]
        if @book.destroy  
            flash[:success] = "Delete Success !"
        else
            flash[:danger] = "Delete Failed !"
        end
        redirect_to books_path
    end
    
    def edit
       @book = Book.find(params[:id]) 
       @name_button = "Update Book"
    end

    def update
        @book =Book.find(params[:id])
        if @book.update(book_params)
            flash[:success] = "Update Success !"
            redirect_to books_path
        end
    end

    def change_status
        @book = Book.find_by id: params[:id]
        unless @book.status == params[:status]
            @book.update status: params[:status]
            flash[:success] = "Change Success !"
            # byebug
        end
        redirect_to books_path
    end
    
    private 

    def book_params 
        params.require(:book).permit :book_name, :description,:publish_date,:category_id,:author,:image_url
    end
    
    def is_login?
        return if current_user
        flash[:danger] = "You need Login !"
        redirect_to login_path
    end
    
    
end
