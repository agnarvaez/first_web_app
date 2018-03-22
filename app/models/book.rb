class Book < ApplicationRecord
  validates_presence_of :title, :authors, :price, :category, :publisher, :publish_date, :isbn
  belongs_to :category
  belongs_to :publisher

  has_many :book_authors
  has_many :authors, through: :book_authors

  def full_title
    "{title}"
  end
end
