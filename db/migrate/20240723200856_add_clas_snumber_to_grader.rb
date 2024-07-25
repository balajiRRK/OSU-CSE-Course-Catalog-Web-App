class AddClasSnumberToGrader < ActiveRecord::Migration[7.1]
  def change
    add_column :graders, :class_number, :integer
  end
end
