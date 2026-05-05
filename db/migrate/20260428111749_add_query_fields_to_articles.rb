class AddQueryFieldsToArticles < ActiveRecord::Migration[8.1]
  def change
    add_column :articles, :featured, :boolean
    add_column :articles, :published_at, :datetime
    add_column :articles, :word_count, :integer
  end
end
