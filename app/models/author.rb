class Author < ApplicationRecord
  has_one_attached :photo
  has_many :books, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  def full_name
    "#{first_name} #{last_name}"
  end
end
