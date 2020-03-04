class PostCommentsController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		comment = current_user.post_comments.new(post_comment_params)
		# この書き方でも同じ効果があります
		# comment = Post_comment.new(post_comment_params)
		# comment.user_id  =  current_user.id
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book)
	end
	def destroy
		@post_comment = PostComment.find(params[:book_id])
		@post_comment.destroy
		redirect_back(fallback_location: books_path)
	end
	private
	def post_comment_params
		params.require(:post_comment).permit(:comment,:book_id,:user_id)
	end
end
