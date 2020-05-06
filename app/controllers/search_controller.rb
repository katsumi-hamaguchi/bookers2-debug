class SearchController < ApplicationController
	def search
        @users = User.search(params[:search])
		@books = Book.search(params[:search])
		
	end
end
