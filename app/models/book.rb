class Book < ApplicationRecord

  extend FriendlyId

  friendly_id :title, :use => :slugged


  belongs_to :author
  has_one_attached :photo
  has_many :loans

  has_and_belongs_to_many :genre


    # Method to acept a loan
    def change_copies(copies)

      update(copies_available: copies)
    end

    def self.ransackable_attributes(auth_object = nil)
      ["author_id",  "synopsis", "title"]
    end
    def self.ransackable_associations(auth_object = nil)
      ["author", "genre"]

    end



  validates :title, presence: true
  validates :isbn, presence: true
  validates :publication_year, presence: true
  validates :copies_available, presence: true
  validates :author_id, presence: true
  validates :genre_ids, presence: true
  validates :synopsis, presence: true

end
