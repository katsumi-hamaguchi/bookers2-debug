class BookCommentsController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
	    @book_comment = BookComment.new(post_comment_params)
	    @book_comment.user_id = current_user.id
	    @book_comment.book_id = @book.id
	    if @book_comment.save
	       flash[:success] = "Comment was successfully created."
	       redirect_to book_path(@book)
	     else
	     	@new_book = Book.new
	     	render "/books/show"
	     end
       
	end
	def destroy
		book_comment = BookComment.find(params[:id])
		book_comment.destroy
		
	    
	    redirect_to book_path(params[:book_id])

	end

	private
	def post_comment_params
	    params.require(:book_comment).permit(:comment)
	end
end
