class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :cancel, :acept, :return]
  before_action :authenticate_user!
  before_action :check_user_role, only: [:cancel, :acept, :show]

  # GET /loans
  def index
    @loans = Loan.all
  end

  # GET /loans/:id
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
    @user = User.where(role_id: '2')

  end

  # PATCH /loans/:id/cancel
  def acept
    if @loan.acept_loan
      redirect_to loans_path, notice: 'Loan was successfully canceled.'
    else
      render :show
    end
  end

    # PATCH /loans/:id/cancel
    def return
      @book = Book.where(id: @loan.book_id)
      if @loan.return_loan

      @book.change_copies(@book[0].copies_available + 1)

        redirect_to loans_path, notice: 'Loan was successfully canceled.'
      else
        render :show
      end
    end


  # POST /loans
  def create
    @user = User.where(id: current_user.id)
    @book = Book.where(id: loan_params[:book_id])
    @loan = Loan.add_loan(loan_params[:book_id], loan_params[:user_id], loan_params[:loan_date], loan_params[:due_date], loan_params[:comments])


    puts @user[0].id
    if @loan.save
      @book.change_copies(@book[0].copies_available - 1)
      if @user[0].role_id == 2
        redirect_to book_path(loan_params[:book_id]), notice: 'Loan was successfully created.'
      else
        redirect_to @loan, notice: 'Loan was successfully created.'

      end

    else
      render :new
    end

  end

  # PATCH /loans/:id/cancel
  def cancel
    @book = Book.where(id: @loan.book_id)

    if @loan.cancel_loan
      @book.change_copies(@book[0].copies_available + 1)

      redirect_to loans_path, notice: 'Loan was successfully canceled.'
    else
      render :show
    end
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:book_id, :user_id, :loan_date, :due_date, :comments)
  end
end
