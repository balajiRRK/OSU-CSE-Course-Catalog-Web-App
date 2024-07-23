class Course < ApplicationRecord
    # a course may have many sectionsS
    has_many :sections, primary_key: :courseId, dependent: :destroy
    has_many :recommendations, dependent: :destroy

   # Validations for course
  validates :courseId, presence: true, uniqueness: { scope: :term }
  validates :catalog_number, presence: true
  validates :title, presence: true
  validates :description, presence: true
#   validates :short_Description, presence: true
  validates :component, presence: true
  validates :term, presence: true
  validates :campus, presence: true
  validates :subject, presence: true

end
