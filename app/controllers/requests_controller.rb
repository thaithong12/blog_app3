class RequestsController < ApplicationController
    def new
        @book = Book.new
    end

    def index
        @book = Book.all.where(status: 1).paginate(page: params[:page],per_page: 15).by_created_at
    end

    def update
        render :new
    end


    
end
