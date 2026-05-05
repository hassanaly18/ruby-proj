class RenameItemsToProducts < ActiveRecord::Migration[8.1]
  def change
    rename_table :items, :products
  end
end
