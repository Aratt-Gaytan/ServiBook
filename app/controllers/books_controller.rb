class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update]


  def index
    @books = Book.includes(:author, :genre)
  end

  def show
    @book = Book.includes(:author, :genre).find(params[:id])


  end

  def new
    @book = Book.new
    @genres = Genre.all
    @authors = Author.all
  end

  def edit
    @genres = Genre.all
    @authors = Author.all
  end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy

    redirect_to books_path
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'El libro fue creado exitosamente.'
    else
      @genres = Genre.all
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'El libro fue actualizado exitosamente.'
    else
      @genres = Genre.all
      render :edit
    end
  end


  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :isbn, :publication_year, :copies_available, :synopsis, :author_id, :photo, genre_ids: [])
  end


end
