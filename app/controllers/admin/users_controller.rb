module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_user, only: [:show, :edit, :update, :destroy]

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
      @user.destroy
      redirect_to admin_users_path
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
      # Permitir los parámetros obligatorios y opcionales
      permitted_params = [:name, :email, :address, :phone, :role_id]

      # Agregar los campos de contraseña si se proporcionan valores
      if params[:user][:password].present?
        permitted_params << :password
        permitted_params << :password_confirmation
      end

      params.require(:user).permit(permitted_params)
    end


  end
end
