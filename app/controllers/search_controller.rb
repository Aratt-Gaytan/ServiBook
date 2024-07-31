class SearchController < ApplicationController
  before_action :authenticate_user!


  # GET /articles or /articles.json
  def index
    @query = Book.ransack(params[:q])
    @authors = Author.all  # Optionally, fetch all genres for the dropdown menu
    @genres = Genre.all  # Optionally, fetch all genres for the dropdown menu
    @books = @query.result.includes(:author).order(created_at: :desc)
  end
end
