class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def new
　  @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    book = Book.new(book_params)


     if book.save
        flash[:notice] = 'Book was successfully created.'
        redirect_to "/books/#{book.id}"
     else  
       flash.now[:danger] = ' z '
       render :"/books"
     end



  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
    redirect_to "/books/#{book.id}"
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroyed."
    redirect_to "/books"
    end
  end

  private
  # ストロングパラメータ
  def book_params
    params.permit(:title, :body)
  end
end