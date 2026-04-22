class RenameProductsToItems < ActiveRecord::Migration[8.1]
  def change
    rename_table :products, :items
  end
end
