class GenresController < ApplicationController
  before_action :find_one, only: [:show, :edit, :update, :destroy] # this allows to add  find_one in the beginning of the methods mentioned
  before_action :authenticate_user!
  before_action :check_user_role, only: [:edit, :update, :new]

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end



  def new
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    @genre.update(genre_params)

    redirect_to genre_path(@genre)
  end


  def create
    genre = Genre.create(genre_params)

    redirect_to genres_path
  end

  def destroy
    @genre = Genre.find(params[:id])

    @genre.destroy

    redirect_to genres_path
  end


  private
  def genre_params
    params.require(:genre).permit(:name, :description, :photo)
  end

  def find_one
    @genre = Genre.find(params[:id])
  end





end
