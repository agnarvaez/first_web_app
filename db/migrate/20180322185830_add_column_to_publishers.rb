class AddColumnToPublishers < ActiveRecord::Migration[5.0]
  def change
    add_column :publishers, :title, :string
    add_column :publishers, :city, :string
    add_column :publishers, :state, :string
  end
end
