class BookAuthor < ApplicationRecord
  belongs_to :user
  belongs_to :author
end
