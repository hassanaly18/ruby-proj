class AddDetailsToTasks < ActiveRecord::Migration[8.1]
  def change
    add_column :tasks, :cost, :decimal, precision: 5, scale: 2
    add_column :tasks, :priority, :integer, null: false
  end
end
