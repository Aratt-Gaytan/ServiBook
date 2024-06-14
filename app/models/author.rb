class Author < ApplicationRecord
  has_one_attached :photo
  has_many :libros, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true

end
