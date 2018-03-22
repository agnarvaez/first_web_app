class BookAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :book_authors do |t|
      t.references :author, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps
    end
  end
end
