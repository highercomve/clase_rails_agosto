class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])  
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(authorize_params)
    if @book.save
      redirect_to books_path, notice: "Book created"
    else
      render 'new'
    end 
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(authorize_params)
      redirect_to books_path, notice: "Book Updated"
    else
      render 'edit'     
    end
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path, notice: "Book Deleted"
    end 
  end

  private

  def authorize_params
    params.require(:book).permit!
  end
end
