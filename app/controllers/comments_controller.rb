class CommentsController < ApplicationController

  def show
  end

  def create
    # @comment = Comment.new(comment_params)
    return if current_user == nil
    @book = Book.find(params["comment"]["book_id"])
    @comment = @book.comments.new(content: params["comment"]["content"])
    @comment.update_attributes(user_id: current_user.id)
    if @comment.save
      redirect_to @book
    end 
  end

  def destroy
    byebug
  end
end
