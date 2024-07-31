require 'rails_helper'

RSpec.describe Book, type: :model do

  let(:author) { create(:author) }
  let(:genre) { create(:genre) }
  let(:book) { create(:book, author: author, genres: [genre]) }

  describe "associations" do
    it { should belong_to(:author) }
    it { should have_one_attached(:photo) }
    it { should have_many(:loans) }
    it { should have_and_belong_to_many(:genres) }
  end

  describe "#change_copies" do
    it "updates the copies_available attribute" do
      book.change_copies(5)
      expect(book.copies_available).to eq(5)
    end
  end

  describe "ransackable_attributes" do
    it "returns the correct searchable attributes" do
      expect(Book.ransackable_attributes).to include("author_id", "synopsis", "title")
    end
  end

  describe "ransackable_associations" do
    it "returns the correct searchable associations" do
      expect(Book.ransackable_associations).to include("author", "genre")
    end
  end
end
