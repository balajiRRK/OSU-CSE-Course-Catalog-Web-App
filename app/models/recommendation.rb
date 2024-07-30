# The sources used for this file vary, including ChatGPT and Carmen resources:
# https://www.youtube.com/playlist?list=PLlxmoA0rQ-Lx45j3D6da7-Iqvo5wtjKBm
# https://www.youtube.com/playlist?list=PLS1QulWo1RIbNBXZAeVbkkHEj9zsEbXQK
# https://www.railstutorial.org/book
# https://www.youtube.com/watch?v=GY7Ps8fqGdc
# https://chatgpt.com/

class Recommendation < ApplicationRecord
  belongs_to :instructor, class_name: 'User'
  belongs_to :student, class_name: 'User', optional: true
  belongs_to :course, optional: true

  validates :notes, presence: true
  validates :student_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :recommendation_type, presence: true
end
