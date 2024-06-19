class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :cancel]

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
  end

  # POST /loans
  def create
    @loan = Loan.add_loan(loan_params[:book_id], loan_params[:user_id], loan_params[:loan_date], loan_params[:due_date], loan_params[:comments])

    if @loan.save
      redirect_to @loan, notice: 'Loan was successfully created.'
    else
      render :new
    end
  end

  # PATCH /loans/:id/cancel
  def cancel
    if @loan.cancel_loan
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
