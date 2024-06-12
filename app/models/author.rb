class Author < ApplicationRecord
  has_one_attached :photo

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true

end
