class Grader < ApplicationRecord
  # Existing validations
  validate :name_check
  validate :email_check
  validate :phone_number_check
  validates :courses_wish_to_grade, presence: true
  validates :courses_qualified_to_grade, presence: true
  
  # New validation for availability
  validate :availability_present

  # Serialize availability as a Hash using JSON encoding
  serialize :availability, Hash, coder: JSON

  # Define days of the week for availability
  DAYS_OF_WEEK = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]

  # Existing custom validations
  def name_check
    unless name =~ /^[a-z ,.'-]+$/i
      errors.add(:name, 'should be a valid name')
    end
  end

  def email_check
    unless email =~ /\A[a-zA-Z]+\.[0-9]+@osu\.edu\z/i
      errors.add(:email, 'should be a [lastname].[number]@osu.edu email address')
    end
  end

  def phone_number_check
    unless phone_number =~ /^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$/i
      errors.add(:phone_number, 'should be a valid phone number (ex: ###-###-####)')
    end
  end

  private

  # Custom validation method for availability
  def availability_present
    return if availability.blank?

    valid_times = availability.values.any? do |times|
      times.is_a?(Array) && times.size == 2 && times.any?(&:present?)
    end

    errors.add(:availability, "must have at least one day with times set") unless valid_times
  end
end
