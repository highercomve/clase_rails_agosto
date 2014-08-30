class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id]) 
    @comment = Comment.new 
    if current_user.nil?
      @leido = false
    else
      @leido = @book.user_ids.include?(current_user.id) 
    end
  end

  def leer
    @book = Book.find(params[:id])
    @book.users << current_user
    redirect_to book_path(@book)
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_user.books.build(authorize_params)
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
    @book.users << current_user if @book.users.blank?
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
