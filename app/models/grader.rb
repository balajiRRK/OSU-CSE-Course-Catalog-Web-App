class Grader < ApplicationRecord
  query_constraints [:class_number, :course_id,:id]
  belongs_to :course, primary_key: :courseId, class_name: "Course",foreign_key: "course_id", dependent: :destroy
  belongs_to :section,  query_constraints: [:class_number, :course_id], dependent: :destroy

  validates :email, presence: true
  validates :class_number, uniqueness: {scope: :course_id}
end
