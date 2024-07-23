class Grader < ApplicationRecord
  validates :name, presence: true 
  validate :email_check
  validate :phone_number_check
  validates :courses_wish_to_grade, presence: true
  validates :courses_qualified_to_grade, presence: true


  def email_check
    unless email =~ /\A[a-zA-Z]+\.[0-9]+@osu\.edu\z/i
      errors.add(:email, 'should be a [lastname].[number]@osu.edu email address')
    end
  end

  def phone_number_check
    unless phone_number =~ /^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/
      errors.add(:phone_number, 'should be a valid phone number (ex: ###-###-####)')
    end
  end

end
