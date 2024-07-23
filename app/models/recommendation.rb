class Recommendation < ApplicationRecord
  belongs_to :instructor, class_name: 'User'
  belongs_to :student, class_name: 'User', optional: true
  belongs_to :course

  validates :notes, presence: true
  validates :student_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
