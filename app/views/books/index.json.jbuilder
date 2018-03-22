
json.array!(@books) do |book|
  json.extract! book, :id, :title, :price, :category_id, :publisher_id, :publish_date, :isbn
  json.url book_url(book, format: :json)
end
