class Book < ApplicationRecord
  has_many :authors
  has_many :authors, through: :book_authors
end
