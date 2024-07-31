class AuthorsController < ApplicationController
  before_action :find_one, only: [:show, :edit, :update, :destroy] # this allows to add  find_one in the beginning of the methods mentioned
  before_action :authenticate_user!
  before_action :check_user_role, only: [:edit, :update, :new]

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
    @books = Book.where(author_id: params[:id] )
  end


  def new
    @author = Author.new
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])

    @author.update(author_params)

    redirect_to author_path(@author)
  end


  def create
    @author = Author.create(author_params)

    redirect_to authors_path
  end

  def destroy


    @author = Author.find(params[:id])
    @author.destroy
    # if @author.book.empty?
    #   flash[:notice] = "Author deleted successfully"
    # else
    #   flash[:alert] = "Cannot delete author with associated books"
    # end

    redirect_to authors_path
  end


  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth, :nationality, :photo, :biography, :date_of_death)
  end

  def find_one
    @author = Author.find(params[:id])
  end





end
