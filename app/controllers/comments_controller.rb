class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
    book = Book.find(params[:book_id])
    comment = book.comments.build(parametros_permitidos)
    comment.user_id = current_user.id
    if comment.save
      redirect_to book_path(book), notice: "Se ha creado un comentario exitosamente!!"
    else
      redirect_to book_path(book), alert: comment.errors.full_messages.inspect
    end
  end

  def destroy
  end

  def parametros_permitidos
    params.require(:comment).permit(:review)
  end
end
