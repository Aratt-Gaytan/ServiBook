
class AdminUsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]


  def index
    @users = User.includes(:role)
  end

  def show
    @user = User.includes(:role).find(params[:id])

  end

  def new
    @user = User.new
    @roles = Role.all

  end

  def edit
    @roles = Role.all

  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      redirect_to admin_users_path, notice: 'El usuario es administrador, no se puede eliminar.'

    else
      redirect_to admin_users_path, notice: 'El usuario fue eliminado correctamente.'
    end
  end

  def create
    @user = User.new(book_params)
    if @user.save
      redirect_to @user, notice: 'El usuario fue creado exitosamente.'
    else
      @roles = Role.all
      render :new
    end
  end

  def update
    if @user.update(book_params)
      redirect_to @user, notice: 'El usuario fue actualizado exitosamente.'
    else
      @roles = Role.all
      render :edit
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def book_params
    params.require(:user).permit(:name, :email, :publication_year, :copies_available, :synopsis, :author_id, :photo, genre_ids: [])
  end


end
