class Author < ApplicationRecord
  has_many :book_authors
  has_many :books, through: :book_authors

  validates_presence_of :first_name, :last_name, :genre, :dobirth, :dodeath

  def full_name
  "#{first_name} #{last_name}"
  end
  def product
    Product.unscoped { super }
  end
  def destroy
    self.destroy!
  end
end
