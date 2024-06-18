class Loan < ApplicationRecord
  belongs_to :book
  belongs_to :user
  belongs_to :status

  validates :loan_date, :due_date, presence: true

    # Method to create a new loan
    def self.add_loan(book_id, user_id, loan_date, due_date, comments = nil)
      status = Status.find_by(name: 'active')
      create(book_id: book_id, user_id: user_id, status_id: status.id, loan_date: loan_date, due_date: due_date, comments: comments)
    end

    # Method to cancel a loan
    def cancel_loan
      update(status: Status.find_by(name: 'cancelled'), returned_date: Date.today)
    end


end
