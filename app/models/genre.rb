class Genre < ApplicationRecord
  has_and_belongs_to_many :book
  has_one_attached :photo


  validates :name, presence: true

end
