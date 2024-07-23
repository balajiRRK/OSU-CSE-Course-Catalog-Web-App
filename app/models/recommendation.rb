class Recommendation < ApplicationRecord
  belongs_to :course
  belongs_to :instrucrtor, class_name: 'User'

  validates :student_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :recommendation_type, presence: true, inclusion: { in: %w(general specific) }
end
