class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @books = Book.all

    # Depuración adicional
    #
    #
    #
    @user = User.find(current_user.id )



  end
end
