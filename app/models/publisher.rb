class Publisher < ApplicationRecord
  validates_presence_of :title, :city, :state
  has_many :books

  def to_s
    self.title
  end
  def product
    Product.unscoped { super }
  end
end
