class GenresController < ApplicationController
  before_action :find_one, only: [:show, :edit, :update, :destroy] # this allows to add  friendly.find_one in the beginning of the methods mentioned
  before_action :authenticate_user!
  before_action :check_user_role, only: [:edit, :update, :new]
  before_action :check_confirmed


  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.friendly.find(params[:id])
    @books = @genre.book

  end



  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.friendly.find(params[:id])
  end

  def update
    @genre = Genre.friendly.find(params[:id])

    @genre.update(genre_params)

    redirect_to genre_path(@genre)
  end


  def create
    @genre = Genre.create(genre_params)

    redirect_to genres_path
  end

  def destroy
    @genre = Genre.friendly.find(params[:id])

    @genre.destroy

    redirect_to genres_path
  end


  private
  def genre_params
    params.require(:genre).permit(:name, :description, :photo)
  end

  def find_one
    @genre = Genre.friendly.find(params[:id])
  end





end
