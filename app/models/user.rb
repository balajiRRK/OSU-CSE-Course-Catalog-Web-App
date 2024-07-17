class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { student: 'student', instructor: 'instructor', admin: 'admin' }


  validate :email_domain_check

  private

  def email_domain_check
    unless email =~ /\A[a-zA-Z]+\.[0-9]+@osu\.edu\z/i
      errors.add(:email, 'should be a [lastname].[number]@osu.edu email address')
    end
  end
end
