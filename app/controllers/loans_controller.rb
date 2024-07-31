class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :cancel, :acept, :return]
  before_action :authenticate_user!
  before_action :check_user_role, only: [:cancel, :acept, :show]
  before_action :check_user_role

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
      redirect_to loans_path, notice: 'Loan was successfully acepted.'
    else
      render :show
    end
  end

    # PATCH /loans/:id/cancel
    def return
      @book = Book.find(@loan.book_id)
      if @loan.return_loan

      @book.change_copies(@book.copies_available + 1)

        redirect_to loans_path, notice: 'Loan was successfully canceled.'
      else
        render :show
      end
    end


  # POST /loans
  def create
    @user = User.find(loan_params[:user_id])
    @book = Book.find(loan_params[:book_id])
    @loan = Loan.add_loan(loan_params[:book_id], loan_params[:user_id], loan_params[:loan_date], loan_params[:due_date], loan_params[:comments])

    servibook_mail = ServiBookMail.new

    msg = ''



    if @loan.save
      @book.change_copies(@book.copies_available - 1)


      mail_content = {
        name: @user.name,
        book: @book.title,
        address: @user.address,
        start_date:  loan_params[:loan_date],
        end_date: loan_params[:due_date],
        email: @user.email,
        loan: @loan.id

      }


      @response = servibook_mail.send_invoice(mail_content)

      if @response.success?
        msg = "Invoice sent to your email #{@user.email}"
      else
        error_message = @response.parsed_response['error'] || @response.parsed_response['message'] || @response.body
        msg = "An error occurred: #{error_message}"
      end




      if @user.role_id == 2
        redirect_to book_path(loan_params[:book_id]), notice: "Loan was successfully created. #{msg}"
      else
        redirect_to @loan, notice: "Loan was successfully created. #{msg}"

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
