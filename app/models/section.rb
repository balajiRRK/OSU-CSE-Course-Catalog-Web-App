class Section < ApplicationRecord
 
  
  belongs_to :course, primary_key: :courseId, class_name: "Course", foreign_key: "course_id", dependent: :destroy
  # The where part is to separate instructors where the class_number is the same, 
  # so the course_id check is added to make sure it's the instructor for the course.

  has_many :instructors, -> { where self.find_by(course_id: :course_id)  },primary_key: :class_number, foreign_key: "class_number",  dependent: :destroy
  has_many :graders,-> { where self.find_by(course_id: :course_id) }, primary_key: :class_number, foreign_key: "class_number", dependent: :destroy

  #  has_many :instructors, -> { where self.find_by(course_id: :course_id)  },primary_key: :class_number, foreign_key: "class_number",  dependent: :destroy
  # has_many :graders,-> { where self.find_by(course_id: :course_id) }, primary_key: :class_number, foreign_key: "class_number", dependent: :destroy
  # 
 # Validations for section
  validates :course_id, presence: true
  validates :catalog_number, presence: true
  validates :class_number, presence: true
  validates :component, presence: true
  validates :instruction_mode, presence: true
  validates :term, presence: true
end

