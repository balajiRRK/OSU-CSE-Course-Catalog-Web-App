class AddCourseIdToGraders < ActiveRecord::Migration[7.1]
  def change
    add_column :graders, :course_id, :string
  end
end
