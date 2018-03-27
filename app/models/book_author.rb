class BookAuthor < ApplicationRecord
  belongs_to :author
  belongs_to :book

  def product
    Product.unscoped { super }
  end
end
