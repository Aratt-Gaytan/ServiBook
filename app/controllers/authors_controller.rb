class AuthorsController < ApplicationController
  before_action :find_one, only: [:show, :edit, :update, :destroy] # this allows to add  find_one in the beginning of the methods mentioned
  before_action :authenticate_user!

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
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
    author = Author.create(author_params)

    redirect_to authors_path
  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy

    redirect_to authors_path
  end


  private
  def author_params
    params.require(:author).permit(:first_name, :last_name, :date_of_birth, :nationality)
  end

  def find_one
    @author = Author.find(params[:id])
  end




end
