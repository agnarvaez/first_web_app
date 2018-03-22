class AddColumnsToBook < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :publish_date, :date
    add_reference :books, :category, foreign_key: true
    add_reference :books, :publisher, foreign_key: true
  end
end
