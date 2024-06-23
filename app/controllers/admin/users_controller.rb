module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = User.includes(:role)
    end

    def show
      @user = User.find(params[:id])
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
      puts "the id = #{@user.id}"
      if @user.destroy
        redirect_to admin_users_path, notice: 'El usuario fue eliminado exitosamente.'
      else
        redirect_to admin_users_path, alert: 'El usuario no se pudo eliminar, verifica que no sea administrador o tenga registros asociados.'
      end
    rescue ActiveRecord::InvalidForeignKey => e
      puts e
      redirect_to admin_users_path, alert: "El usuario no se pudo eliminar, verifica que no sea administrador o tenga registros asociados."
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: 'El usuario fue creado exitosamente.'
      else
        @roles = Role.all
        render :new
      end
    end

    def update
      if @user.update(user_params)
        redirect_to admin_users_path, notice: 'El usuario fue actualizado exitosamente.'
      else
        @roles = Role.all
        puts @user.errors.full_messages
        render :edit
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      permitted_params = [:name, :email, :address, :phone, :role_id]

      if params[:user][:password].present?
        permitted_params << :password
        permitted_params << :password_confirmation
      end

      params.require(:user).permit(permitted_params)
    end
  end
end
