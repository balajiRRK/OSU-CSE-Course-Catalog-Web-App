class Recommendation < ApplicationRecord
    belongs_to :instructor, class_name: 'User'
    belongs_to :student, class_name: 'User', optional: true
  
    validates :message, presence: true
  end  