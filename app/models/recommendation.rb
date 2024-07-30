# The sources used for this file vary, including ChatGPT and Carmen resources:
# https://www.youtube.com/playlist?list=PLlxmoA0rQ-Lx45j3D6da7-Iqvo5wtjKBm
# https://www.youtube.com/playlist?list=PLS1QulWo1RIbNBXZAeVbkkHEj9zsEbXQK
# https://www.railstutorial.org/book
# https://www.youtube.com/watch?v=GY7Ps8fqGdc
# https://chatgpt.com/

class Recommendation < ApplicationRecord  #recommendation model
  belongs_to :instructor, class_name: 'User'  #recommendation belongs to instructor
  belongs_to :student, class_name: 'User', optional: true #recommendation belongs to student
  belongs_to :course, optional: true    #recommendation belongs to course

  validates :notes, presence: true  #validate notes
  validates :student_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }   #validate student email
  validates :recommendation_type, presence: true  #validate recommendation type
  validates :email_check, :course_id_check  #validate email and course id

  private

  enum status: { pending: 0, approved: 1, rejected: 2 }  #enum status

  def email_check   #email check
    unless student_email =~ /\A[a-zA-Z]+\.[0-9]+@osu.edu\z/i   #unless student email matches
      errors.add(:student_email, "Must be lastname.#@osu.edu")  #add error
    end
  end

  def course_id_check   #course id check
    unless course_id =~ /[0-9]{4}/i  #unless course id matches
      errors.add(:course_id, "should be a 4 digit course id")   #add error
    end
  end

end
