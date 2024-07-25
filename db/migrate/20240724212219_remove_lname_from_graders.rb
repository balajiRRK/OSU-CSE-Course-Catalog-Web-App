class RemoveLnameFromGraders < ActiveRecord::Migration[7.1]
  def change
    remove_column :graders, :lname, :string
  end
end
