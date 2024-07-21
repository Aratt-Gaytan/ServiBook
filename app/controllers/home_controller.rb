class HomeController < ApplicationController
  before_action :authenticate_user!

  def index


    @books = Book.limit(6)  # Retrieve only the first 6 books
    @genres = Genre.limit(6)  # Retrieve only the first 6 books
    @authors = Author.limit(6)  # Retrieve only the first 6 books

    # Depuración adicional
    # ... (your debugging code can remain here)
    #
    #
    @user = User.find(current_user.id)
  end
end
