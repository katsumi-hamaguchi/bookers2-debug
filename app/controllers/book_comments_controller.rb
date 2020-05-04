class BookCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
	    comment = BookComment.new(post_comment_params)
	    comment.user_id = current_user.id
	    comment.book_id = book.id
	    comment.save
	    redirect_to book_path(book)
		
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
