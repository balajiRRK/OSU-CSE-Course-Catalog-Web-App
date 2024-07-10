class Section < ApplicationRecord
  belongs_to :course, primary_key: :courseId, class_name: "Course", foreign_key: "course_id"
 
  
 # Validations for section
  validates :course_id, presence: true
  validates :catalog_number, presence: true
  validates :class_number, presence: true
  validates :component, presence: true
  validates :instruction_mode, presence: true
  validates :term, presence: true
end

