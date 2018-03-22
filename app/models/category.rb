class Category < ApplicationRecord
  validates_presence_of :title
  has_many :books

  def to_s
    self.title
  end
  def product
    Product.unscoped { super }
  end
  def destroy
    self.destroy!
  end
end
