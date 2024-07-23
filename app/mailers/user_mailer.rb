class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invite_student.subject
  #
  def invite_student
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
