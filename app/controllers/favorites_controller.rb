class FavoritesController < ApplicationController
	def create
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.new(book_id: book.id)
		# 上の記述と同じ効果
		# favorite = Favorite.new(user_id: current_user.id, book_id: @book.id)
		favorite.save
		redirect_back(fallback_location: books_path)
		# -favoritesの流れ-
		# favorite controllerでcreateのactionが呼び出されるとBook.findで本を探し出して
		#  favorite.newでいいねを作成。その際のuser.id はcurrentで指定、book_idは（book_id: @book.id）で指定して
		#  favorite.saveでshemaのfavoritesに格納される
	end
	def destroy
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: book.id)
		favorite.destroy
		redirect_to books_path
	end
end
