class Genre < ApplicationRecord
  has_and_belongs_to_many :book
  has_one_attached :photo


  validates :name, presence: true
  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name"]
  end
end
