class Grader < ApplicationRecord
  belongs_to :course, primary_key: :courseId, class_name: "Course",foreign_key: "course_id", dependent: :destroy
  belongs_to :section, primary_key: :class_number, class_name: "Section", foreign_key: "class_number", dependent: :destroy
end
